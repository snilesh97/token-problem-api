# frozen_string_literal: true

class TokenCreator
  attr_accessor :created_tokens

  def initialize
    self.created_tokens = []
  end

  def create_tokens
    COUNT.times do |index|
      time = Time.now
      created_tokens << Token.create(
        value: value(time, index),
        available_at: time
      )
    end
    created_tokens
  end

  private

  COUNT = 20

  def value(time, index)
    Digest::MD5.hexdigest("#{time.to_i}+ #{index}".to_s)
  end
end

