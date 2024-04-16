module Api
  module V1
    class QuotesController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user, only: [:create]

      MONTHS_IN_A_YEAR = 12

      def index
        Quote.all
      end

      def create
        quote = Quote.new(quote_params)

        if quote.save
          render json: QuoteRepresenter.new(quote).as_json, status: :created
        else
          render json: quote.errors, status: :unprocessable_entity
        end
      end

      private

      def quote_params
        params.require(:quote).permit(:value_to_be_insured)
      end

      def authenticate_user
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
        rescue ActiveRecord::RecordNotFound, JWT::DecodeError
          render status: :unauthorized
      end
    end
  end
end
