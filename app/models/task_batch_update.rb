class TaskBatchUpdate
  def self.update(user, task_ids)
    Task.transaction do
      user.tasks
      .where(id: task_ids)
      .update_all(['completed_at = COALESCE(completed_at, ?)', Time.current])

      user.tasks
      .where.not(id: task_ids)
      .update_all(completed_at: nil)
    end
  end
end
