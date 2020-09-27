# frozen_string_literal: true

module Api
  module V1
    class TokensController < BaseController
      def index
        render_sucess(values(Token.available), TOKEN_AVAILABLE)
      end

      def create
        created_tokens = TokenCreator.new.create_tokens
        render_sucess(values(created_tokens), TOKEN_CREATED)
      end

      def assign
        token = TokenAssigner.new.assign
        return render_sucess(token.value, TOKEN_ASSIGNED) if token.present?

        render_failure
      end

      def refresh_token
        token = TokenRefresherService.new(value: value).call!
        return render_sucess(token.value, TOKEN_REFRESHED) if token.present?

        render_failure
      end

      def allocate
        token = TokenAllocaterService.new(value: value).call!
        return render_sucess(token.value, TOKEN_ALLOCATE) if token.present?

        render_failure
      end

      def unallocate
        token = TokenAvailableService.new(value: value).call!
        return render_sucess(token.value, TOKEN_UNALLOCATE) if token.present?

        render_failure
      end

      def destory
        destroyed = TokenDestroyService.new(value: value).call!
        return render_destory(value) if destroyed

        render_failure
      end

      private

      def value
        params[:value]
      end
    end
  end
end
