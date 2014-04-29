"use strict"
angular.module("raptorforum").controller "MainCtrl", ['$scope', 'Topic', ($scope, Topic) ->

  $scope.selectedPage = 'Home'

  $scope.topic = Topic;

  $scope.post =
    title: "Post Title"
    content: "Post Content"
    poster: "Dionysos25"

  $scope.chat = [
      {
          user: "Dionysos25"
          message: "Hey What's up!"
      }
      {
          user: "MooCow22"
          message: "not much, just doing some work on my side project."
      }
  ]

  $scope.addTopic = () ->
    $scope.topic.poster = "Dionysos25"
    $scope.result = $scope.topic.save()
    debugger

  $scope.selectPage = (page) ->
    $scope.selectedPage = page;

    return
]