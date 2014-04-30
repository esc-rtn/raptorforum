require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @reply = replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:replies)
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, reply: { content: @reply.content, poster: @reply.poster }
    end

    assert_response 201
  end

  test "should show reply" do
    get :show, id: @reply
    assert_response :success
  end

  test "should update reply" do
    put :update, id: @reply, reply: { content: @reply.content, poster: @reply.poster }
    assert_response 204
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete :destroy, id: @reply
    end

    assert_response 204
  end
end
