'use strict'

class UserService

  setLoggedInStatus:(status)->
    @loggedIn = status

  isLoggedIn:->
    @loggedIn

angular.module("tweetStream").factory( "userService",
                                       ["$http", ($http) -> new UserService($http)]
                                     )
