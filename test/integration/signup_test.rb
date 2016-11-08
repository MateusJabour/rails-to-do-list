require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Your name', with: 'John Dow'
    fill_in 'Your email', with: 'john@example.org'
    fill_in 'Your password', with: 'test'
    fill_in 'Confirm your password', with: 'test'
    click_on 'Create my account'

    asset_equal '/login', page.current_path
    assert page.has_text?("Your account has been created.")
  end
end
