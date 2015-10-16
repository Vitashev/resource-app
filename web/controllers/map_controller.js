(function () {

	angular.module('restApp').controller("MapCtrl", ["$scope", '$rootScope', function ($scope, $rootScope) {
		$scope.center = {
			lat: 49.842,
			lng: 24.032,
			zoom: 17
		};

		$scope.options = {
			coordsToMap: false,
			showOnMapLatlngs: [],
			updateMap: false,
			created: false,
			latlngs: [],
			zoom: 0,
			newCoords: []
		};

		$scope.coordsToMap = function (coordinates) {
			console.log('test');
			$scope.options.coordsToMap = true;
			$scope.options.showOnMapLatlngs = L.polygon(coordinates);
		};

		$scope.updateMapView = function (coordinates, zoom) {
			$scope.options.updateMap = true;
			$scope.options.latlngs = coordinates;
			$scope.options.zoom = zoom;
		};

		$scope.$watch('options.created', function(val){

			if(val){
				$rootScope.coords = [];
				var i;
				for (i in $scope.options.newCoords) {
					$rootScope.coords.push({lat: $scope.options.newCoords[i].lat, lng: $scope.options.newCoords[i].lng});
				}
				$scope.options.created = false;
			}

		});
	}]);

})();
