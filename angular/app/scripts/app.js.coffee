"use strict"
angular.module("raptorforum", ["ngCookies","ngResource","ngSanitize","ngRoute"])
.config ($routeProvider, $httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  $routeProvider.when("/",
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  ).when("/about",
    templateUrl: "views/about.html"
    controller: "AboutCtrl"
  ).when("/contact",
    templateUrl: "views/contact.html"
    controller: "ContactCtrl"
  ).otherwise redirectTo: "/"
  return

