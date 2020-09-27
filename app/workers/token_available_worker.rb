# frozen_string_literal: true

class TokenAvailableWorker
  include Sidekiq::Worker

  def perform(id)
    TokenAvailableService.new(id: id).call
  end
end
