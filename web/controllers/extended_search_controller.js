(function(){
	'use strict';
	angular.module('restApp')

		.controller('ExtendedSearchController', ['$scope', '$http','SearchService',
			function($scope, $http, SearchService) {
				$scope.query = {};
				$scope.resources = {};

				SearchService.getClasses().then(function(data){
					$scope.classes = data.data;
					$scope.classes.unshift({class_id: undefined, name:'chose class'});
				});
				$scope.search = function(){
					if(length($scope.query))
						console.log(buildQuery($scope.query));
					SearchService.search(buildQuery($scope.query))
						.then(function(data){
							$scope.resources = data.data.items;
							console.log(data.data);
						});
				};
				function buildQuery(query){
					var str = '';
					for(var main_key in query)
					{
						str += main_key + '=model';
						for(var key in query[main_key])
						{
							if(query[main_key][key]){
								if ( query[main_key][key].start || query[main_key][key].end)
									str += beetwen(key, query[main_key][key]);
								else
									str += '&' + key + '=' + query[main_key][key];
							}
						}
						str += '&';
					}
					str = str.substr(0, str.length-1);
					return str;
				};
				function beetwen(key, p){
					var s = '';
					if(p.start && !p.end)
						s += '&' + key + '=' + p.start + 'to';
					if(!p.start && p.end)
						s += '&' + key + '=' + 'to' + p.end;
					if(p.start && p.end)
						s += '&' + key + '=' + p.start + 'to' + p.end;
					return s;
				};
				function length(obj){
					return Object.keys(obj).length;
				};
			}]);

})();