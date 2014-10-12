'use strict'

LoginCtrl = ($scope, $rootScope, $auth, $location) ->

  $scope.submitRegistration = ->
    $auth.submitRegistration($scope.registrationForm)
      .then (resp)=>
        $location.url "home"
      .catch (resp)=>
        console.log resp

  $scope.submitLogin = ->
    $auth.submitLogin($scope.loginForm)
      .then (resp)=>
        $location.url "home"
      .catch (resp)=>
        console.log resp

  $scope.authenticateWithTwitter = ->
    $auth.authenticate('twitter')
      .then (resp)=>
        $location.url "home"
      .catch (resp)=>
        console.log resp

  $rootScope.$on 'alerts:message', (event, message)=>
    $scope.message = message.text

  $scope.hideAlert = ()->
    $scope.message = null

LoginCtrl.$inject = ["$scope", "$rootScope", "$auth", "$location"]
angular.module("tweetStream").controller "LoginCtrl", LoginCtrl
