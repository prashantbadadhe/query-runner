'use strict'

var module = angular.module('demo.controllers', []);
module.controller("QueryController", [ "$scope", "QueryService",
		function($scope, QueryService) {

			$scope.queryDto = {
				queryId : null,
				queryName : null,
				queryKey : null,
			};

			QueryService.getQueryById(1).then(function(value) {
				console.log(value.data);
			}, function(reason) {
				console.log("error occured");
			}, function(value) {
				console.log("no callback");
			});

			$scope.saveQuery = function() {
				QueryService.saveQuery($scope.queryDto).then(function() {
					console.log("works");
					QueryService.getAllQueries().then(function(value) {
						$scope.allQueries= value.data;
					}, function(reason) {
						console.log("error occured");
					}, function(value) {
						console.log("no callback");
					});
		
					$scope.queryDto = {
						queryId : null,
						queryKey : null,
						queryName : null,
					};
				}, function(reason) {
					console.log("error occured");
				}, function(value) {
					console.log("no callback");
				});
			}
			
			$scope.getQueryResult = function() {
				QueryService.getQueryResult($scope.queryDto).then(function() {
					console.log("works");
					QueryService.getQueryResult($scope.queryDto).then(function(value) {
						//$scope.queryResult= value.data;
						$scope.resultArr=value.data;
					}, function(reason) {
						console.log("error occured");
					}, function(value) {
						console.log("no callback");
					});

					$scope.queryDto = {
						queryId : null,
						queryKey : null,
						queryName : null,
					};

				}, function(reason) {
					console.log("error occured");
				}, function(value) {
					console.log("no callback");
				});
			}

			
	$scope.getAllQueries = function() {
								
					QueryService.getAllQueries().then(function(value) {
						$scope.allQueries= value.data;
					}, function(reason) {
						console.log("error occured");
					}, function(value) {
						console.log("no callback");
					});
					
					$scope.queryDto = {
							queryId : null,
							queryKey : null,
							queryName : null,
						};
			}
	$scope.getAllQueries();
	
		} ]);