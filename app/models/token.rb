# frozen_string_literal: true

class Token < ApplicationRecord
  acts_as_paranoid

  AVAILABLE_AFTER = 1.minutes
  DESTROY_AFTER = 5.minutes

  enum status: { available: 0, unavailable: 1 }

  validates_presence_of :value, :status, :available_at
  validates_uniqueness_of :value

  after_commit :post_commit_operations

  def can_mark_available?
    available_at <= Time.now && unavailable?
  end

  def can_destory?
    (updated_at + 5.minutes) <= Time.now
  end

  private

  def post_commit_operations
    return if deleted?

    TokenAvailableWorker.perform_in(AVAILABLE_AFTER.from_now, id) if unavailable?
    TokenDestroyWorker.perform_in(DESTROY_AFTER.from_now, id)
  end
end
