require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

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

    @category = categories(:freds_category) 
    # fixture name defined in categories
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
    assert_not_nil assigns(:categories)
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

end
