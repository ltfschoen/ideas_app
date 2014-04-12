require 'test_helper'

class CommentsControllerTest < ActionController::TestCase


  # You include the helpers from Warden, 
  # which is what Devise uses, then run into test mode. 
  # After that, you can use login_as for login. 
  # And remember to Warden.test_reset! after each test.
  include Warden::Test::Helpers
  Warden.test_mode!

  setup do

    #@user = FactoryGirl.create(:user, :email => 'test@gmail.com')
    @user = users(:fred)
    login_as(@user, :scope => :user)

    @comment = comments(:one)
  end

  # teardown do
  #   Warden.test_reset!
  # end

  # test "already login" do
  #   visit root_path
  # end

  test "should get index" do
    get :index
    assert_response :success, @response.body
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { body: @comment.body, commentable_id: @comment.commentable_id, user_id: @comment.user_id }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    patch :update, id: @comment, comment: { body: @comment.body, commentable_id: @comment.commentable_id, user_id: @comment.user_id }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end
end
