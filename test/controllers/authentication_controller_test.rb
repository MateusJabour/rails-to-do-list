require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase
  tests TasksController

  test 'requires authentication' do
    get :index, params: {locale: I18n.locale}
    assert_redirected_to login_path(locale: I18n.locale)
  end

  test 'render page for authenticated user' do
    session[:user_id] = FactoryGirl.create(:user).id

    get :index, params: {locale: I18n.locale}
    assert_response :ok
  end
end
