'use strict'

NavigationCtrl = ($scope, $location, webService) ->

  success = (response) =>
    $location.url "/"

  error = (response) =>
    console.log response

  $scope.logout = ()=>
    promise = webService.logout()
    promise.then success, error

NavigationCtrl.$inject = ["$scope", "$location", "webService"]
angular.module("tweetStream").controller "NavigationCtrl", NavigationCtrl
