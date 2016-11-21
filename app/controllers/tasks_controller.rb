class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
    @tasks = current_user.tasks.pending_first
  end

  def create
    task = current_user.tasks.new(task_params)
    options = if task.save
                { notice: t('flash.tasks.create.notice') }
              else
                errors = task.errors.full_messages.to_sentence
                {alert: t('form.error_inline', errors: errors)}
              end
    redirect_to tasks_path, options
  end

  def batch_update
    TaskBatchUpdate.update(current_user, params[:task_ids])
    redirect_to tasks_path, notice: t('flash.tasks.batch_update.notice')
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
