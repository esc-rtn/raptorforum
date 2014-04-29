require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, topic: { content: @topic.content, poster: @topic.poster, title: @topic.title }
    end

    assert_response 201
  end

  test "should show topic" do
    get :show, id: @topic
    assert_response :success
  end

  test "should update topic" do
    put :update, id: @topic, topic: { content: @topic.content, poster: @topic.poster, title: @topic.title }
    assert_response 204
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, id: @topic
    end

    assert_response 204
  end
end
