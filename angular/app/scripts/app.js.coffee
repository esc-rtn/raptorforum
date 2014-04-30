"use strict"
angular.module("raptorforum", ["ngCookies","ngResource","ngSanitize","ngRoute", "textAngular"])
.config ($routeProvider, $httpProvider) ->
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

