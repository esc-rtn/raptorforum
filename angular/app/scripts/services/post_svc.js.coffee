angular.factory 'Post', ['$http', 'Alerts', '$q', ($http, Alerts, $q) ->
  topic = {}

  post.find_by_id = (id) ->
    $http.get("/post/#{id}").success (data) ->
      return data;

  post.find_all = () ->
    $http.get("/post").success (data) ->
      post.view_test_data.list = data;
      return data;


  post.create = (post) ->
    $http.post("/post", post).success (data) ->
      if data["error"]
        return {id:"createPostError", type:'error', msg: data['error']}
      else
        return {id:"createPostInfo", type: 'alert-info', msg: 'New post created.', timeout:3000 }


  post.update = (post) ->
    $http.put("/post}", post).success (data) ->
      if data["error"]
        return {id:"updatePostError", type:'error', msg: data['error']}
      else
        return {id:"updatePostInfo", type: 'alert-info', msg: 'Post updated.' }


  post.delete = (post) ->
    return $http.delete("/post", post).success (response) ->
      error = response['error']
      if error
        return {id:"deletePostError", type:'error', msg: data['error']}
      else
        return {id:"deletePostInfo", type: 'alert-info', msg: 'Post deleted.' }


  return post

]
