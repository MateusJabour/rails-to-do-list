require 'test_helper'

class RemoveTaskTest < ActionDispatch::IntegrationTest
  test "with valid data" do
    task = FactoryGirl.create(:task)
    login_as(task.user)

    within("#task-#{task.id}") do
      click_on t('actions.remove')
    end

    click_on submit('task.remove')

    assert_equal tasks_path(I18n.locale), current_path
    assert page.has_text?(t('flash.tasks.destroy.notice'))
    refute page.has_text?(task.title)
  end
end
