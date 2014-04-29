angular.module("raptorforum").factory 'Topic', ['$http', '$q', ($http, $q) ->

  class Topic
    id = null
    title = ''
    content = ''
    poster = ''

  constructor: () ->
    @init()

  refresh: () ->
    @init()

  init: () ->


  Topic.find_by_id = (id) ->
    $http.get("/api/topics/#{id}").success (data) ->
      return data;

  Topic.find_all = () ->
    $http.get("/api/topics").success (data) ->
      topic.view_test_data.list = data;
      return data;


  Topic.save = () ->
    debugger
    post_data = {title:Topic.title, content: Topic.content, poster: Topic.poster}
    $http.post("/api/topics", post_data).success (data) ->
      if data["error"]
        return {id:"createTopicError", type:'error', msg: data['error']}
      else
        return {id:"createTopicInfo", type: 'alert-info', msg: 'New topic created.', timeout:3000 }


  Topic.update = (topic) ->
    $http.put("/api/topics}", topic).success (data) ->
      if data["error"]
        return {id:"updateTopicError", type:'error', msg: data['error']}
      else
        return {id:"updateTopicInfo", type: 'alert-info', msg: 'Topic updated.' }


  Topic.delete = (topic) ->
    return $http.delete("/api/topics", topic).success (response) ->
      error = response['error']
      if error
        return {id:"deleteTopicError", type:'error', msg: data['error']}
      else
        return {id:"deleteTopicInfo", type: 'alert-info', msg: 'Topic deleted.' }


  return Topic

]
