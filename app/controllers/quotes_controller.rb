class QuotesController < ApplicationController
  def index
    Quonte.all
  end


  def create
    Quote.new(quote_params)
  end

  private

  def quote_params
    params.require(:quote).permit(:value_to_be_insured)
  end
end
