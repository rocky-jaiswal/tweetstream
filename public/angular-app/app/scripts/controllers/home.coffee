'use strict'

HomeCtrl = ($scope, webService) ->
  success = (response) =>
    $scope.greeting = "Hello " + response.data.hello

  error = (response) =>
    console.log response

  promise = webService.getGreeting()
  promise.then success, error

HomeCtrl.$inject = ["$scope", "webService"]
angular.module("tweetStream").controller "HomeCtrl", HomeCtrl