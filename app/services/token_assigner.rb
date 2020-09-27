# frozen_string_literal: true

class TokenAssigner
  def assign
    token = Token.available.sample
    return nil if token.nil?

    return token if token.update(status: 'unavailable', available_at: Time.now + 1.minute)
  end
end
