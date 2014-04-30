"use strict"
angular.module("raptorforum").controller "MainCtrl", ['$scope', '$timeout','Topic', ($scope, $timeout, Topic) ->

  $scope.selectedPage = 'Home'
  $scope.topic = Topic;

  $scope.loadTopics = () ->
    Topic.find_all().success (data) ->
      $scope.topicList = data

  $scope.loadReplies = (id) ->
    Topic.get_replies(id).success (data) ->
      $scope.replyList = data

  $scope.addTopic = () ->
    #auth and usr mgmt is a to-do
    $scope.topic.poster = "Dionysos25"
    $scope.topic.save().success (data) ->
      $scope.result = data
      $scope.loadTopics();

  $scope.addReply = (id) ->
    #auth and usr mgmt is a to-do
    selectedTopic = Topic.find_by_id(id);
    selectedTopic.saveReply($scope.reply).success (data) ->
      $scope.result = data
      $scope.loadReplies(id);

  $scope.selectPage = (page) ->
    $scope.selectedPage = page;

  $scope.chat = [
      {
          user: "Dionysos25"
          message: "Hey What's up!"
      }
      {
          user: "MooCow22"
          message: "not much, just doing some work on my side project."
      }
      {
        user: "Dionysos25"
        message: "Really? What's it do?"
      }
      {
        user: "MooCow22"
        message: "not much, but eventually will be a single page forum (angular), with realtime chat (socket.io)."
      }
  ]

  $scope.loadTopics()
  return
]