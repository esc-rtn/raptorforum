angular.factory 'TopicFactory', ['$http', 'Alerts', '$q', ($http, Alerts, $q) ->
  topic = {}

  topic.find_by_id = (id) ->
    $http.get("/api/topic/#{id}").success (data) ->
      return data;

  topic.find_all = () ->
    $http.get("/api/topic").success (data) ->
      topic.view_test_data.list = data;
      return data;


  topic.create = (topic) ->
    $http.post("/api/topic", topic).success (data) ->
      if data["error"]
        return {id:"createTopicError", type:'error', msg: data['error']}
      else
        return {id:"createTopicInfo", type: 'alert-info', msg: 'New topic created.', timeout:3000 }


  topic.update = (topic) ->
    $http.put("/api/topic}", topic).success (data) ->
      if data["error"]
        return {id:"updateTopicError", type:'error', msg: data['error']}
      else
        return {id:"updateTopicInfo", type: 'alert-info', msg: 'Topic updated.' }


  topic.delete = (topic) ->
    return $http.delete("/api/topic", topic).success (response) ->
      error = response['error']
      if error
        return {id:"deleteTopicError", type:'error', msg: data['error']}
      else
        return {id:"deleteTopicInfo", type: 'alert-info', msg: 'Topic deleted.' }


  return topic

]
