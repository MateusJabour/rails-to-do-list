require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'with valid credentials' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on 'Log in'

    fill_in 'Your e-mail', with: user.email
    fill_in 'Your password', with: 'test'
    click_on 'Access your account'

    assert_equal tasks_path, current_path
  end

  test 'with invalid credentials' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on 'Log in'
    fill_in 'Your e-mail', with: user.email
    fill_in 'Your password', with: 'invalid'
    click_on 'Access your account'

    assert_equal login_path, current_path
    assert page.has_text?('Invalid e-mail or password.')
  end
end
