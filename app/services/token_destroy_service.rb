# frozen_string_literal: true

class TokenDestroyService < TokenBaseService
  def call!
    return nil if token.nil?

    return token if token.destroy
  end

  def call
    return nil if token.nil?

    return nil unless token.can_destory?

    return true if token.destroy
  end
end
