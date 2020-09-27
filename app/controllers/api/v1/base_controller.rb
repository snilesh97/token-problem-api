# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      TOKEN_CREATED = 'New Token created'
      TOKEN_AVAILABLE = 'Token Avaialble in pool are'
      TOKEN_ASSIGNED = 'Token is assigned to you'
      TOKEN_REFRESHED = 'Token is refreshed now it is in pool for 5 minutes'
      TOKEN_ALLOCATE = 'Token is allocate to you for next 1 minutes'
      TOKEN_UNALLOCATE = 'Token is marked as avaiable, Now pool can serve'
      TOKEN_DESTROYED = 'Token is destroyed'
      RECORD_NOT_FOUND = 'Record Not Found'

      def render_sucess(data, message)
        render status: 200, json: { message: message, token: data }
      end

      def render_failure(status = 404)
        render status: status, json: { message: RECORD_NOT_FOUND, status: status }
      end

      def render_destory(data)
        render status: 200, json: { message: TOKEN_DESTROYED, token: data }
      end

      private

      def values(token)
        token.map(&:value)
      end
    end
  end
end
