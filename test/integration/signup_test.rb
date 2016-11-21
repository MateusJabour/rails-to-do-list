require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
    visit home_path(I18n.locale)

    click_link t('menu.signup')

    fill_in label('user.name'), with: 'John Doe'
    fill_in label('user.email'), with: 'john@example.org'
    fill_in label('user.password'), with: 'test'
    fill_in label('user.password_confirmation'), with: 'test'
    click_on submit('user.create')

    assert_equal login_path(locale: I18n.locale), page.current_path
    assert page.has_text?(t('flash.signup.create.notice'))
  end

  test 'with invalid data' do
    visit home_path(I18n.locale)
    click_link t('menu.signup')
    click_on submit('user.create')
    assert_equal signup_path(locale: I18n.locale), page.current_path
    assert page.has_text?(t('form.error'))
  end
end
