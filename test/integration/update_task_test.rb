require 'test_helper'

class UpdateTaskTest < ActionDispatch::IntegrationTest
  test "with valid data" do
    task = FactoryGirl.create(:task)
    login_as(task.user)

    within("#task-#{task.id}") do
      click_on t('actions.edit')
    end

    fill_in label('task.title'), with: 'Updated task'
    click_on submit('task.update')

    assert_equal tasks_path(I18n.locale), current_path
    assert page.has_text?(t('flash.tasks.update.notice'))
    assert page.has_text?('Updated task')
  end

  test "with invalid data" do
    task = FactoryGirl.create(:task)
    login_as(task.user)

    within("#task-#{task.id}") do
      click_on t('actions.edit')
    end

    fill_in label('task.title'), with: ''
    click_on submit('task.update')

    assert_equal edit_task_path(task, locale: I18n.locale), current_path
    assert page.has_text?(t('form.error'))
  end
end
