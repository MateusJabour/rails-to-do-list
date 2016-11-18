class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
  end
end
