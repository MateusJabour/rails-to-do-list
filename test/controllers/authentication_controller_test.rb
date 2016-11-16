require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase
  tests TasksController

  test 'requires authentication' do
    get :index
    assert_redirected_to login_path
  end

  test 'render page for authenticated user' do
    session[:user_id] = FactoryGirl.create(:user).id

    get :index
    assert_response :ok
  end
end
