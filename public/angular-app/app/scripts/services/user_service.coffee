'use strict'

class UserService

  setLoggedInStatus:(status)->
    @loggedIn = status

  isLoggedIn:->
    @loggedIn || localStorage.getItem("auth_headers")

angular.module("tweetStream").factory( "userService",
                                       ["$http", ($http) -> new UserService($http)]
                                     )
