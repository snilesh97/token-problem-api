# frozen_string_literal: true

class TokenRefresherService < TokenBaseService
  def call!
    return nil if token.nil?

    token if token.update(updated_at: Time.now)
  end
end
