require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  test "should get index" do
    login_as_admin
    get :index
    assert_response :success
    assert_not_nil assigns(:feeds)
  end

  test "should get new" do
    login_as_admin
    get :new
    assert_response :success
  end

  test "should create feed" do
    login_as_admin
    assert_difference('Feed.count') do
      post :create, :feed => { :user_id => users(:jaime).id, :feed_url => "http://feeds.feedburner.com/PageRankAlert" }
    end

    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should show feed" do
    login_as_admin
    get :show, :id => feeds(:jaime_blog).to_param
    assert_response :success
  end

  test "should get edit" do
    login_as_admin
    get :edit, :id => feeds(:jaime_blog).to_param
    assert_response :success
  end

  test "should update feed" do
    login_as_admin
    put :update, :id => feeds(:jaime_blog).to_param, :feed => { }
    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should destroy feed" do
    login_as_admin
    assert_difference('Feed.count', -1) do
      delete :destroy, :id => feeds(:jaime_blog).to_param
    end

    assert_redirected_to feeds_path
  end
end
