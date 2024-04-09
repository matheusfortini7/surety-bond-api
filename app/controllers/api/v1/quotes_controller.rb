module Api
  module V1
    class QuotesController < ApplicationController
      MONTHS_IN_A_YEAR = 12

      def index
        Quote.all
      end

      def create
        quote = Quote.new(quote_params)
        quote.annual_premium = quote.value_to_be_insured * Plan.find_by(name: "Aluguel padrão").rate * 12
        quote.monthly_premium = quote.annual_premium / MONTHS_IN_A_YEAR

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
    end
  end
end
