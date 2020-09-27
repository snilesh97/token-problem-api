# frozen_string_literal: true

class TokenAllocaterService < TokenBaseService
  def call!
    return nil if token.nil?

    return token if token.update(updated_at: Time.now + 1.minute)
  end
end
