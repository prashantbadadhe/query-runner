'use strict'

angular.module('demo.services', []).factory('QueryService',
		[ "$http", "CONSTANTS", function($http, CONSTANTS) {
			var service = {};
			service.getQueryById = function(queryId) {
				var url = CONSTANTS.getQueryByIdUrl + queryId;
				return $http.get(url);
			}
			service.getAllQueries = function() {
				return $http.get(CONSTANTS.getAllQueries);
			}
			service.saveQuery = function(queryDto) {
				return $http.post(CONSTANTS.saveQuery, queryDto);
			}
			service.getQueryResult = function(queryDto) {
				var url = CONSTANTS.getQueryResult + queryDto.queryKey;
				return $http.get(url);
			}
			return service;
		} ]);