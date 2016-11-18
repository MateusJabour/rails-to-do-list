require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  test "with valid data" do
    user = FactoryGirl.create(:user)
    login_as(user)

    fill_in t('form.labels.task.title'), with: 'Some task'
    click_on ('helpers.submit.task.create')

    assert_equal tasks_path(I18n.locale), current_path
    assert page.has_text?(t('flash.tasks.create.notice'))
    assert page.has_text?('Some task')
  end
end
