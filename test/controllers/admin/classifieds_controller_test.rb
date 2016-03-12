require 'test_helper'

class Admin::ClassifiedsControllerTest < ActionController::TestCase
  setup do
    @admin_classified = admin_classifieds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_classifieds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_classified" do
    assert_difference('Admin::Classified.count') do
      post :create, admin_classified: { category_id: @admin_classified.category_id, description: @admin_classified.description, location: @admin_classified.location, price: @admin_classified.price, slug: @admin_classified.slug, title: @admin_classified.title }
    end

    assert_redirected_to admin_classified_path(assigns(:admin_classified))
  end

  test "should show admin_classified" do
    get :show, id: @admin_classified
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_classified
    assert_response :success
  end

  test "should update admin_classified" do
    patch :update, id: @admin_classified, admin_classified: { category_id: @admin_classified.category_id, description: @admin_classified.description, location: @admin_classified.location, price: @admin_classified.price, slug: @admin_classified.slug, title: @admin_classified.title }
    assert_redirected_to admin_classified_path(assigns(:admin_classified))
  end

  test "should destroy admin_classified" do
    assert_difference('Admin::Classified.count', -1) do
      delete :destroy, id: @admin_classified
    end

    assert_redirected_to admin_classifieds_path
  end
end
