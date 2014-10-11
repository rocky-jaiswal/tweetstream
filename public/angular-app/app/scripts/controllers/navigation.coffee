'use strict'

NavigationCtrl = ($scope, $location, $rootScope, webService, userService) ->

  success = (response) =>
    $location.url "/"

  error = (response) =>
    console.log response

  $scope.logout = ()=>
    promise = webService.logout()
    promise.then success, error

  $scope.hideAlert = ()=>
    $scope.message = null

  $rootScope.$on 'auth:login-success', (event, user)=>
    userService.setLoggedInStatus(true)
    $scope.ifLoggedIn = true

  $rootScope.$on 'alerts:message', (event, message)=>
    $scope.message = message.text

  $scope.ifLoggedIn = userService.isLoggedIn() && $location.url() isnt "/"

NavigationCtrl.$inject = ["$scope", "$location", "$rootScope", "webService", "userService"]
angular.module("tweetStream").controller "NavigationCtrl", NavigationCtrl
