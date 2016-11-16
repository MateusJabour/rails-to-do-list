require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Your name', with: 'John Doe'
    fill_in 'Your email', with: 'john@example.org'
    fill_in 'Your password', with: 'test'
    fill_in 'Confirm your password', with: 'test'
    click_on 'Create my account'

    assert_equal login_path, page.current_path
    assert page.has_text?("Your account has been created.")
  end

  test "with invalid data" do
    visit root_path
    click_link 'Sign up'
    click_on 'Create my account'
    assert_equal signup_path, page.current_path
    assert page.has_text?("Please double check your form before continuing:")
  end
end
