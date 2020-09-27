# frozen_string_literal: true

module Api
  module V1
    class TokenSerializer < ActiveModel::Serializer
      attributes :value
    end
  end
end
