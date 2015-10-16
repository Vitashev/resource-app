/**
 * Created by romangrb on 10/6/15.
 */
(function() {
    'use strict';
    angular
        .module('restApp')
        .controller('resourceLogCtrl', resourceLogCtrl);
    resourceLogCtrl.$inject = ['$scope', '$http', 'RestService', '$rootScope', '$location', '$route', 'PaginationService', 'constant'];

    function resourceLogCtrl($scope, $http, RestService,  $rootScope, $location, $route, PaginationService, constant) {


        var DAY_DIFF = 1,
            dateToday = new Date(),
            date_end_default = new Date(),
            date_start_default = new Date(dateToday.setDate(date_end_default.getDate()-DAY_DIFF)),
            dateMaxTimer = new Date(),
            dateUTCinMillisec = 60000;


        $scope.operation = {

            type:{
                created: true,
                updated: false,
                deleted: false
            },
            resource:{
                name:''
            },
            date:{
                dateStart:date_start_default ,
                dateEnd:date_end_default
            }
        };

        $scope.minDate = null;
        $scope.maxDateEnd = new Date();
        $scope.maxDateStart = dateMaxTimer.setDate(dateMaxTimer.getDate()-DAY_DIFF);
        $scope.hourStep = 1;
        $scope.minuteStep = 10;
        $scope.showMeridian = false;

        $scope.dateOptions = {
            startingDay: 1,
            showWeeks: false
        };

        $scope.$watch("operation.date.dateStart", function(time) {

            if(time===null){
                time = date_start_default;
                $scope.operation.date.dateStart = time;
            }
            date_start_default = time;
            $scope.operation.date.start = toMySQLtime(time);
        }, true);

        $scope.$watch("operation.date.dateEnd", function(time) {

            if(time===null){
                time = date_end_default;
                $scope.operation.date.dateEnd = time;
            }
            date_end_default = time;

            var dateLimitStart = new Date().setDate(date_end_default.getDate()-DAY_DIFF);
            $scope.operation.date.dateStart = $scope.maxDateStart = dateLimitStart;
            $scope.operation.date.end = toMySQLtime(time);

        }, true);


        $scope.findResourceLog = function() {
            $scope.queryData = buildQuery($scope.operation);
           // $scope.queryData = $scope.queryData.replace(/ /g,"%20");
            console.log($scope.newString);
            if(!$scope.queryData) {
                alert('Для відображення операцій виберіть хоча б один тип');
                return;
            }
            console.log('operations/search?' + $scope.queryData);
            RestService.getData('operations/search?' + $scope.queryData)
                .then(function(data){
                      $scope.operation_log = data.data;
                    console.log($scope.operation_log);
                });
        };

        function buildQuery(res) {

            var requestData = toRequestFormatQuery(res),
                str = '';

            for (var key in requestData){
                str += key + '=' + requestData[key] + '&';
            }
            return str.slice(0, - 1);
        }


        function toRequestFormatQuery(query) {

            var str = '',
                requestData = {},
                OperTypeId=query['type'],
                OperResourceName=query['resource'],
                OperDateInterval=query['date'];

            for (var key in OperTypeId)
                if (OperTypeId[key]) {
                    str += operationToKey(key)+',';
                }

            if(!str) return;

            requestData.type=str.slice(0,-1);

            if(OperResourceName['name']) requestData.name = OperResourceName['name'];

            if(!!(OperDateInterval['dateStart']&&OperDateInterval['dateEnd'])){
                requestData.date = OperDateInterval['start']+'to'+OperDateInterval['end'];
            }

            return requestData;
        }

        function operationToKey (name){
            var typeId;
            switch (name){
                case 'created':
                    return typeId = 1;
                    break;
                case 'updated':
                    return typeId = 2;
                    break;
                case 'deleted':
                    return typeId = 3;
                    break;
            }
        }


        function toMySQLtime(date){
            //2015-11-06 12:08:46
            var formatedMysqlString = (new Date ((new Date((new Date(date))
                    .toISOString() )).getTime(date) - ((new Date())
                    .getTimezoneOffset()*dateUTCinMillisec)))
                .toISOString().slice(0, 19).replace('T', ' ');
            return  formatedMysqlString;
        }

        //Pagination start
        $scope.currentPage = PaginationService.currentPage;

        $scope.getPages = function(pageCount) {
            return PaginationService.getPages(pageCount);
        };

        $scope.switchPage = function(index){
            if($scope.queryData){
                PaginationService.switchPage(index, constant.operationsQuery + '/search?' + $scope.queryData + '&').then(function(data){
                    $scope.operation_log = data.data;
                    $scope.currentPage = PaginationService.currentPage;
                });
            }else {
                PaginationService.switchPage(index, constant.operationsQuery + '?').then(function(data){
                    $scope.operation_log = data.data;
                    $scope.currentPage = PaginationService.currentPage;
                });
            }

        };

        $scope.setPage = function(pageLink, pageType){
            PaginationService.setPage(pageLink, pageType, $scope.operation_log._meta.pageCount).then(function(data){
                $scope.operation_log = data.data;
                $scope.currentPage = PaginationService.currentPage;
            });
        };


        //Pagination end

    }

})();
