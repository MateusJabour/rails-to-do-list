require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
    visit home_path(I18n.locale)

    click_link t('menu.signup')

    fill_in t('form.labels.user.name'), with: 'John Doe'
    fill_in t('form.labels.user.email'), with: 'john@example.org'
    fill_in t('form.labels.user.password'), with: 'test'
    fill_in t('form.labels.user.password_confirmation'), with: 'test'
    click_on t('helpers.submit.user.create')

    assert_equal login_path(locale: I18n.locale), page.current_path
    assert page.has_text?(t('flash.signup.create.notice'))
  end

  test 'with invalid data' do
    visit home_path(I18n.locale)
    click_link t('menu.signup')
    click_on t('helpers.submit.user.create')
    assert_equal signup_path(locale: I18n.locale), page.current_path
    assert page.has_text?(t('form.error'))
  end
end
