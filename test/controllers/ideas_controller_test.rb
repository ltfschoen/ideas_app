require 'test_helper'

class IdeasControllerTest < ActionController::TestCase

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

    @idea = ideas(:one)
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
    assert_not_nil assigns(:ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea" do
    assert_difference('Idea.count') do
      post :create, idea: { description: @idea.description, name: @idea.name, user_id: @idea.user_id }
    end

    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should show idea" do
    get :show, id: @idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea
    assert_response :success
  end

  test "should update idea" do
    patch :update, id: @idea, idea: { description: @idea.description, name: @idea.name, user_id: @idea.user_id }
    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should destroy idea" do
    assert_difference('Idea.count', -1) do
      delete :destroy, id: @idea
    end

    assert_redirected_to ideas_path
  end
end
