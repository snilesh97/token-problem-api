# frozen_string_literal: true

class TokenDestroyWorker
  include Sidekiq::Worker

  def perform(id)
    TokenDestroyService.new(id: id).call
  end
end
