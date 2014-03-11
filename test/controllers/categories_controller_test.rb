require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:freds_category) 
    # fixture name defined in categories
  end

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
