require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  test "with valid data" do
    user = FactoryGirl.create(:user)
    login_as(user)

    fill_in label('task.title'), with: 'Some task'
    click_on submit('task.create')

    assert_equal tasks_path(I18n.locale), current_path
    assert page.has_text?(t('flash.tasks.create.notice'))
    assert page.has_text?('Some task')
  end

  test "with invalid data" do
    user = FactoryGirl.create(:user)
    login_as(user)

    click_on submit('task.create')

    assert_equal tasks_path(I18n.locale), current_path
    assert page.has_text?(t('form.error_inline', errors: ''))
  end
end
