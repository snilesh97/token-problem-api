# frozen_string_literal: true

class TokenAvailableService < TokenBaseService
  def call
    token.update(status: 'available') if token.present? && token.can_mark_available?
  end

  def call!
    return nil if token.nil?

    return nil if token.unavailable?

    return token if token.update(status: 'available')
  end
end
