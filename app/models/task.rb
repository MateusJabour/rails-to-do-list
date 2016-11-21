class Task < ApplicationRecord
  PENDING_STATUS = 'pending'.freeze
  COMPLETE_STATUS = 'complete'.freeze

  scope :pending_first, -> {
    order('completed_at DESC NULLS FIRST, title ASC')
  }

  belongs_to :user

  validates_presence_of :title

  def status
    completed_at ? COMPLETE_STATUS : PENDING_STATUS
  end
end
