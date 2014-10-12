'use strict'

app = angular.module('tweetStream', ['ng-token-auth', 'ngRoute'])

app.config ($authProvider) ->
  $authProvider.configure
    apiUrl:  '/api/v1'
    storage: 'localStorage'
    authProviderPaths:
      twitter: '/auth/twitter'

app.config ($routeProvider) ->
    $routeProvider
      .when '/',     { templateUrl: 'views/login.html', controller: 'LoginCtrl' }
      .when '/home', { templateUrl: 'views/home.html',  controller: 'HomeCtrl' }
      .otherwise     { redirectTo: '/' }

# app.config ($httpProvider) ->
#   interceptor = ["$rootScope", "$location", "$q", ($rootScope, $location, $q) ->

#     success = (resp) ->
#       resp

#     err = (resp) ->
#       if resp.status is 401
#         $location.url "/"
#         $rootScope.$broadcast("alerts:message", {text: "Sorry, an authentication error has occurred."})
#         return $q.defer().promise
#       $q.reject resp

#     (promise) ->
#       promise.then success, err
#   ]
#   $httpProvider.responseInterceptors.push interceptor

app.config ($httpProvider) ->
  $httpProvider.interceptors.push ($q, $rootScope, $location) ->
    responseError: (rejection) ->
      #console.log rejection
      $location.url "/"
      $rootScope.$broadcast("alerts:message", {text: "Sorry, an authentication error has occurred."}) if rejection.status is 401
      $q.reject(rejection)
