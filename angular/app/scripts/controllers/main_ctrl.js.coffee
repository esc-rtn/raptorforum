"use strict"
angular.module("raptorforum").controller "MainCtrl", ($scope) ->

  $scope.selectedPage = 'Home'

  $scope.topic = new Topic();

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
    topicFactory = TopicFactory()
    $scope.topic.poster = "Dionysos25"
    topicFactory.create($scope.topic)

  $scope.selectPage = (page) ->
    $scope.selectedPage = page;

    return
