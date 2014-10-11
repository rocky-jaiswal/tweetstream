'use strict'

HomeCtrl = ($scope, $rootScope, webService) ->
  success = (response) =>
    $rootScope.$broadcast("alerts:message", {text: "Logged in successfully!"})
    $scope.greeting = "Hello " + response.data.hello

  error = (response) =>
    console.log response

  promise = webService.getGreeting()
  promise.then success, error

  $scope.hideAlert = ()=>
    $scope.message = null

  $rootScope.$on 'auth:login-success', (event, user)=>
    $rootScope.$broadcast("alerts:message", {text: "Logged in successfully!"})

  $rootScope.$on 'alerts:message', (event, message)=>
    console.log message
    $scope.message = message.text

HomeCtrl.$inject = ["$scope", "$rootScope", "webService"]
angular.module("tweetStream").controller "HomeCtrl", HomeCtrl
