'use strict'

LoginCtrl = ($scope, $auth, $location) ->

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

LoginCtrl.$inject = ["$scope", "$auth", "$location"]
angular.module("tweetStream").controller "LoginCtrl", LoginCtrl
