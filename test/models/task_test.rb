require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "requires title" do
    task = Task.create(title: '')
    assert task.errors[:title].any?
  end

  test "requires user" do
    task = Task.create
    assert task.errors[:user].any?
  end

  test "returns status for pending tasks" do
    task = Task.new(completed_at: nil)
    assert_equal Task::PENDING_STATUS, task.status
  end

  test "returns status for completed tasks" do
    task = Task.new(completed_at: Time.current)
    assert_equal Task::COMPLETE_STATUS, task.status
  end
end
