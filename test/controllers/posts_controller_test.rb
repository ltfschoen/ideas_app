require 'test_helper'

class PostsControllerTest < ActionController::TestCase

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

    @post = posts(:freds_post)
  end

  # teardown do
  #   Warden.test_reset!
  # end

  # test "already login" do
  #   visit root_path
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { body: @post.body, email: @post.email, user_id: @post.user_id }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { body: @post.body, email: @post.email, user_id: @post.user_id }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
