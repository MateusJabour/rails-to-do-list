require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'with valid credentials' do
    user = FactoryGirl.create(:user)

    visit home_path(I18n.locale)
    click_on t('menu.login')

    fill_in label('user.email'), with: user.email
    fill_in label('user.password'), with: 'test'
    click_on button('login')

    assert_equal tasks_path(locale: I18n.locale), current_path
  end

  test 'with invalid credentials' do
    user = FactoryGirl.create(:user)

    visit home_path(I18n.locale)
    click_on t('menu.login')
    fill_in label('user.email'), with: user.email
    fill_in label('user.password'), with: 'invalid'
    click_on button('login')

    assert_equal login_path(locale: I18n.locale), current_path
    assert page.has_text?(t('flash.login.create.alert'))
  end
end
