require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
    visit root_path
    click_link t('menu.signup')

    fill_in 'Your name', with: 'John Doe'
    fill_in 'Your email', with: 'john@example.org'
    fill_in 'Your password', with: 'test'
    fill_in 'Confirm your password', with: 'test'
    click_on 'Create my account'

    assert_equal login_path(locale: I18n.locale), page.current_path
    assert page.has_text?(t('flash.signup.create.notice'))
  end

  test 'with invalid data' do
    visit root_path
    click_link t('menu.signup')
    click_on 'Create my account'
    assert_equal signup_path(locale: I18n.locale), page.current_path
    assert page.has_text?(t('form.error'))
  end
end
