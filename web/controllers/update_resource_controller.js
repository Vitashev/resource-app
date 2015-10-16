(function(){
    'use strict';

    angular
        .module('restApp')
        .controller('update', update);
        update.$inject = [
            '$scope',
            '$http',
            'RestService',
            'resourceId',
            '$route',
            '$location',
            'constant',
            '$rootScope',
            'CoordsService',
        ];

        function update($scope, $http, RestService, resourceId, $route, $location, constant, $rootScope, CoordsService) {
            //Coord start

            $scope.coordId = null;
            $scope.coord = {};

            $scope.createCoords = function(coord){
                if(!CoordsService.createCoords(coord, $rootScope.coords, $scope.coordId)){
                    $scope.coordId = null;
                }
                $scope.coord = {};
            };
            $scope.changeCoords = function(coord, coordId){
                var newCoords = CoordsService.changeCoords(coord, coordId);
                $scope.coord = newCoords.coord;
                $scope.coordId = newCoords.coordId;
            };

            $scope.deleteCoords = function(){
                CoordsService.deleteCoords($rootScope.coords, $scope.coordId);
                $scope.coordId = null;
                $scope.coord = {};

            };

            //Coord end

            RestService.getDataById(resourceId, constant.resourcesQuery).then(function(data){
                $scope.resource = data.data;
                $rootScope.coords = CoordsService.geotypeToCoords($scope.resource.coordinates);

                //Get resource class


                RestService.getData(constant.resource_classesQuery + '/search?name=' + $scope.resource.class)
                    .then(function(data){
                        console.log(data.data);
                        var classObj = data.data;
                        $scope.classId = classObj[0].class_id;
                    });

                //Get resource parameters
                RestService.getData(constant.parametersQuery + '/search?resource_id=' + $scope.resource.resource_id)
                    .then(function(data){
                        var params = data.data;
                        $scope.params = {};
                        var i;
                        for (i in params){
                            $scope.params[params[i].attribute_id-1] = params[i];
                        }

                    });

                //Get resource owner
                if($scope.resource.owner){
                    RestService.getData(constant.personal_datasQuery + '/search?personal_data_id=' + $scope.resource.owner.personal_data_id)
                        .then(function(data){
                            $scope.owner = data.data[0];
                        });
                }
            });
            $scope.newParams = {};
            $scope.addNewParams = function(){

            };
            $scope.updateResource= function(resource, owner, params) {

                resource.coordinates = CoordsService.coordsToGeotype($rootScope.coords);
                resource.class_id = $scope.classId;

                var j;
                for (j in $scope.newParams) {
                        $scope.newParams[j].resource_id = resourceId;
                        $scope.newParams[j].attribute_id = parseInt(j)+1;
                        RestService.createData($scope.newParams[j], constant.parametersQuery);
                }

                var i;
                for (i in params) {
                    console.log(' '+ params[i] + params[i].parameter_id + constant.parametersQuery);
                    RestService.updateData(params[i], params[i].parameter_id, constant.parametersQuery);
                }

                if(resource.owner){
                    RestService.updateData(owner, owner.personal_data_id, constant.personal_datasQuery);
                }
                else if (owner && Object.keys(owner).length === constant.paramsNumber){
                    RestService.createData(owner, constant.personal_datasQuery)
                        .then(function(response){
                            resource.owner_data_id = response.data.personal_data_id;
                            RestService.updateData(resource, resourceId, 'resources');
                        });

                } else {
                    RestService.updateData(resource, resourceId, 'resources');
                }
                $location.path('resource/index');
                $route.reload();

            };

        }

})();