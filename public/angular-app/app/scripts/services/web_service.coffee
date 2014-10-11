'use strict'

class WebService

  constructor: (@$http) ->
    @baseUrl = "/api/v1/"

  getGreeting: () ->
    @$http.get(@baseUrl + "greetings")

  logout: ()->
    @$http.delete(@baseUrl + "auth/sign_out")

angular.module("tweetStream").factory("webService",
                                      [ "$http",
                                        ($http) -> new WebService($http)
                                      ])
