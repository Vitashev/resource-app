(function () {

	'use strict';

	angular.module('restApp').directive("leafletMap", function () {

		var link = function ($scope, $element, attrs) {

			var defaults = {
				height: '500px',
				width: '500px',
				position: {
					lat: 49.842,
					lng: 24.032,
					zoom: 17
				}
			};

			$scope.mapCreated = false;

			// Map init

			$scope.updateMapView = function (position, zoom) {
				console.log(position);
				position = angular.fromJson(position);
				if (position) {
					$scope.map.setView(position, zoom);
				} else {
					$scope.map.setView($scope.center, $scope.center.zoom);
				}
			};

			$scope.$watch('coordinates.updateMap', function (val) {
				if (val) {
					console.log($scope.coordinates.latlngs);
					$scope.coordinates.latlngs = angular.fromJson($scope.coordinates.latlngs);
					$scope.updateMapView($scope.coordinates.latlngs[0], $scope.coordinates.zoom);
					$scope.coordinates.updateMap = false;
					if ($scope.geoJsonLayer)
						$scope.map.removeLayer($scope.geoJsonLayer);
					$scope.geoJsonLayer = L.geoJson(L.polygon($scope.coordinates.latlngs).toGeoJSON(), {
						style: style,
						onEachFeature: infoOnEachFeature
					}).addTo($scope.map);
				}
			});

			$scope.$watch('coordinates.coordsToMap', function (val) {
				if (val) {
					if ($scope.geoJsonLayer)
						$scope.map.removeLayer($scope.geoJsonLayer);
					$scope.coordinates.coordsToMap = false;
					$scope.geoJsonLayer = L.geoJson($scope.coordinates.showOnMapLatlngs.toGeoJSON(), {
						style: style,
						onEachFeature: infoOnEachFeature
					}).addTo($scope.map);
				}
			});

			$scope.createMap = function () {
				if (!$scope.mapCreated) {
					$scope.map = L.map('map'); // drawControl is for Leaflet Draw plugin

					$scope.baseLayer = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
						minZoom: 5,
						maxZoom: 19
					});
					$scope.baseLayer.addTo($scope.map);

					initMapElements();

					$scope.updateMapView();

					$scope.mapCreated = true;
				}
			};

			$scope.removeMap = function () {
				if ($scope.mapCreated) {
					if ($scope.coordinates === 'true')
						$scope.coordinates.removeFrom($scope.map);
					if ($scope.info === 'true')
						$scope.info.removeFrom($scope.map);
					if ($scope.add === 'true')
						$scope.drawControl.removeFrom($scope.map);

					$scope.map.remove();

					$scope.mapCreated = false;
				}
			};

			$scope.createMap();

			function initMapElements() {

				initCssProperties();
				initInfoElement();
				initCoordinatesElement();
				initInteractivity();
				initAdding();
				initCenter();
				initGeojson();

				function initCssProperties () {
					$('#map').css({ 'height': attrs.height || defaults.height });
					$('#map').css({ 'width': attrs.width || defaults.width });
				}

				function initInfoElement () {
					if (attrs.info === 'true') {
						$scope.info = L.control.info();
						$scope.info.addTo($scope.map);
					}
				}

				function initCoordinatesElement () {
					if (attrs.coordinates === 'true') {
						$scope.coordinates = L.control.coordinates();
						$scope.coordinates.addTo($scope.map);
					}
				}

				function initInteractivity () {
					if (attrs.interactivity === 'false') {
						$scope.map.dragging.disable();
						$scope.map.touchZoom.disable();
						$scope.map.doubleClickZoom.disable();
						$scope.map.scrollWheelZoom.disable();
						$scope.map.boxZoom.disable();
						$scope.map.keyboard.disable();

						if ($scope.map.tap)
							$scope.map.tap.disable();

						$('#map').css({ 'cursor': 'default' });
						$(".leaflet-control-zoom").css("visibility", "hidden");

					}
				}

				function initAdding () {

					// Controlls localisation

					L.drawLocal.draw.toolbar.actions.title = 'Відмінити створювання';
					L.drawLocal.draw.toolbar.actions.text = 'Відмінити';

					L.drawLocal.draw.toolbar.undo.title = 'Видалити останню точку';
					L.drawLocal.draw.toolbar.undo.text = 'Видалити останню точку';

					L.drawLocal.draw.toolbar.buttons.polygon = 'Створити багатокутник';
					L.drawLocal.draw.toolbar.buttons.rectangle = 'Створити прямокутник';

					L.drawLocal.draw.handlers.polygon.tooltip.start = 'Натисніть на карту, щоб почати створювати багатокутник';
					L.drawLocal.draw.handlers.polygon.tooltip.cont = 'Натисніть на карту, продовжити створювати багатокутник';
					L.drawLocal.draw.handlers.polygon.tooltip.end = 'Натисніть на першу точку, щоб закінчити створювати багатокутник';

					L.drawLocal.draw.handlers.rectangle.tooltip.start = 'Натисніть і потягніть, щоб створити прямокутник';

					L.drawLocal.edit.toolbar.actions.save.title = 'Зберегти зміни';
					L.drawLocal.edit.toolbar.actions.save.text = 'Зберегти';

					L.drawLocal.edit.toolbar.actions.cancel.title = 'Відмінити. Видаляє усі зміни';
					L.drawLocal.edit.toolbar.actions.cancel.text = 'Відмінити';

					L.drawLocal.edit.toolbar.buttons.edit = 'Редагувати об\'єкт';
					L.drawLocal.edit.toolbar.buttons.editDisabled = 'Відсутні об\'єкти для редагування';
					L.drawLocal.edit.toolbar.buttons.remove = 'Видалити об\'єкт';
					L.drawLocal.edit.toolbar.buttons.removeDisabled = 'Відсутні об\'єкти для видалення';

					L.drawLocal.edit.handlers.edit.tooltip.text = 'Переміщайте точки для редагування';

					L.drawLocal.edit.handlers.remove.tooltip.text = 'Натисніть на об\'єкт для видалення';

					if (attrs.add === 'true') {
						$scope.drawnItems = new L.FeatureGroup();
						$scope.map.addLayer($scope.drawnItems);

						$scope.drawControl = new L.Control.Draw({
							draw: {
								polyline: false,
								marker: false,
								circle: false,
								polygon: {
									shapeOptions: {
										color: '#A52A2A'
									}
								}
							},
							edit: {
								featureGroup: $scope.drawnItems,
								edit: true,
								remove: true
							}
						});
						$scope.map.addControl($scope.drawControl);

						$scope.map.on('draw:created', function (e) {
							var type = e.layerType;
							$scope.drawnItem = e.layer;

							$scope.bind = $scope.drawnItem._latlngs;
							var i;
							for (i in $scope.bind) {
								$scope.bind[i].lat = parseFloat($scope.bind[i].lat.toFixed(4));
								$scope.bind[i].lng= parseFloat($scope.bind[i].lng.toFixed(4));
							}
							$scope.coordinates.newCoords = $scope.bind;


							if ($scope.geoJsonLayer)
								$scope.map.removeLayer($scope.geoJsonLayer);
							$scope.geoJsonLayer = L.geoJson($scope.drawnItem.toGeoJSON(), {
								style: style,
								onEachFeature: infoOnEachFeature
							}).addTo($scope.map);
							$scope.coordinates.created = true;
							$scope.$apply();
						});

						$scope.map.on('draw:drawstart', function() {
							if ($scope.drawnItem) {
								$scope.drawnItems.removeLayer($scope.drawnItem);
								$scope.$apply();
							}
						});

						$scope.map.on('draw:deleted', function() {
							$scope.bind = {};
							$scope.$apply();
						});

						$scope.map.on('draw:editstop', function() {
							$scope.bind = $scope.drawnItem._latlngs;
							$scope.$apply();
						});
					}
				}

				function initCenter () {
					if ($scope.center === undefined) {
						$scope.center = defaults.position;
					}
				}

				function initGeojson () {
					if ($scope.geojson !== undefined) {
						$scope.geoJsonLayer.addData($scope.geojson);
					}
				}
			}

			// GeoJson objects styling functions

			function style(feature) {
				return {
					fillColor: '#FD8D3C',
					weight: 2,
					opacity: 1,
					color: 'white',
					dashArray: '3',
					fillOpacity: 0.7
				};
			}

			function infoHighlightFeature(e) {
				var layer = e.target;

				layer.setStyle({
					weight: 5,
					color: '#666',
					dashArray: '',
					fillOpacity: 0.7
				});
				//$scope.geoJsonLayer.update(layer.feature.properties);
			}

			function infoResetHighlight(e) {
				$scope.geoJsonLayer.resetStyle(e.target);
				//$scope.geoJsonLayer.update();
			}

			function infoZoomToFeature(e) {
				$scope.map.fitBounds(e.target.getBounds());
			}

			function infoOnEachFeature(feature, layer) {
				layer.on({
					mouseover: infoHighlightFeature,
					mouseout: infoResetHighlight,
					click: infoZoomToFeature
				});
			}

			// GeoJson functions

			function toGeoJSON(pointsArray) {
				var geojson = {};
				geojson['type'] = 'FeatureCollection';
				geojson['features'] = [];
				var newFeature = {
					"type": "Feature",
					"geometry": {
						"type": "Polygon",
						"coordinates": []
					},
					"properties": {
						"title": "",
						"description":""
					}
				};

				for (var pointIndex in pointsArray) {
					var array = [parseFloat(pointsArray[pointIndex].lat), parseFloat(pointsArray[pointIndex].lng)];
					newFeature.geometry.coordinates.push(array);
				}
				geojson['features'].push(newFeature);
				return geojson;
			}
		};

		return {
			restrict: 'E',
			template: '<div id="map"></div>',
			controller: 'MapCtrl',
			scope: {
				bind: '=bind',
				coordinates: '=update'
			},
			link: link
		};

	});


})();