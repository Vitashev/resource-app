(function(){
    'use strict';
    
    angular
        .module('restApp')
        .controller('index', index);
        index.$inject = ['$scope',
            '$http',
            'RestService',
            '$rootScope',
            '$location',
            '$route',
            'PaginationService',
            'constant',
            'CoordsService'

        ];

        function index($scope, $http, RestService, $rootScope, $location, $route, PaginationService, constant, CoordsService) {

            $rootScope.currentUser = angular.fromJson(localStorage.getItem('user'));
           /* console.log($rootScope.currentUser);
            console.log($rootScope.isLogined);*/

            //Dialog start

            //Dialog end

            //Coord start
            $rootScope.coords = [{lat:49.8415,lng:24.0302},{lat:49.8423,lng:24.0302},{lat:49.8423,lng:24.0325},{lat:49.8415,lng:24.0325}];

            $scope.coordId = null;
            $scope.coord = {};
            $scope.lat = {};
            $scope.lng = {};

            $scope.isShowMap = false;
            $scope.showMap = function (){
                $scope.isShowMap = !$scope.isShowMap;
            };

            $scope.formatCoords = function(coords){
                return  CoordsService.formatCoords (coords);
            };

            $scope.createCoords = function(lat, lng){
                var lat = CoordsService.convertDMSToDD(lat.deg,lat.min, lat.sec).toFixed(4);
                var lng = CoordsService.convertDMSToDD(lng.deg,lng.min, lng.sec).toFixed(4);
                var coord = {lat: lat, lng: lng};
                if(!CoordsService.createCoords(coord, $rootScope.coords, $scope.coordId)){
                    $scope.coordId = null;
                }
                $scope.lat = {};
                $scope.lng = {};
                $scope.coord = {};
            };
            $scope.changeCoords = function(coord, coordId){
                var newCoords = CoordsService.changeCoords(coord, coordId);
                $scope.coord = newCoords.coord;
                var newLat = CoordsService.convertDDToDMS($scope.coord.lat);
                var newLng = CoordsService.convertDDToDMS($scope.coord.lng);
                $scope.lat = {deg: newLat.deg, min: newLat.min, sec: newLat.sec};
                $scope.lng = {deg: newLng.deg, min: newLng.min, sec: newLng.sec};
                $scope.coordId = newCoords.coordId;
            };

            $scope.deleteCoords = function(){
                CoordsService.deleteCoords($rootScope.coords, $scope.coordId);
                $scope.coordId = null;
                $scope.coord = {};
                $scope.lat = {};
                $scope.lng = {};

            };

            //Coord end

            //Load resources per page
            RestService.getData(constant.resourcesQuery + '?&per-page=' + constant.perPage)
                .then(function(data){
                    $scope.resources = data.data;
                });

            //Get personal data start

            RestService.getDataById($rootScope.currentUser.userDataID , constant.personal_datasQuery).then(function(data){
                $scope.personal_data = data.data;
                console.log($scope.personal_data);
            });
            //Get personal data end

            $scope.deleteResource = function(resourceID, ownerId) {

               if(confirm("Ви дійсно бажаєте видалити цей ресурс?") == true && resourceID >0){
                   RestService.deleteData(resourceID, constant.resourcesQuery).then(function(respond){
                   });
                   if (ownerId){
                       RestService.deleteData(ownerId , 'personal_datas');
                   }
                    $route.reload();
                    $location.path('resource/index');

                }
            };

            $scope.createResource = function(resource, owner, params) {
                resource.coordinates = CoordsService.coordsToGeotype($rootScope.coords);
                var createParameters = function(params, resourceId){
                    var i;
                    for (i in params) {
                        if(params[i]){
                            params[i].resource_id = resourceId;
                            params[i].attribute_id = parseInt(i)+1;
                            RestService.createData(params[i], constant.parametersQuery)
                        }
                    }
                };

                if(!owner || Object.keys(owner).length < constant.paramsNumber){
                    RestService.createData(resource, constant.resourcesQuery)
                        .then(function(response){
                            createParameters(params, response.data.resource_id);
                        })
                        .then(function(response){
                            $location.path('resource/index');
                        });
                } else{
                    RestService.createData(owner, constant.personal_datasQuery)
                        .then(function (response) {
                            resource.owner_data_id = response.data.personal_data_id;
                            return RestService.createData(resource, constant.resourcesQuery);
                        })
                        .then(function(response){
                            createParameters(params, response.data.resource_id);
                        })
                        .then(function(response){
                            $location.path('resource/index');
                        });
                }
            };
        }
})();
