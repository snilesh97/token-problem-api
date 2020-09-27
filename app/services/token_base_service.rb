# frozen_string_literal: true

class TokenBaseService
  attr_accessor :token

  def initialize(**args)
    @token = Token.find_by(args)
  end
end
