require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # skip authentication for all except for 'home'

  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get contact_us" do
    get :contact_us
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

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

  end

  # teardown do
  #   Warden.test_reset!
  # end

  # test "already login" do
  #   visit root_path
  # end

  test "should get home" do
    get :home
    assert_response :success
  end

end
