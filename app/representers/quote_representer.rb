class QuoteRepresenter
  require_relative '../services/quote_calculator_service'

  def initialize(quote)
    @value_to_be_insured = quote.value_to_be_insured
    @quote_calculator = QuoteCalculatorService.new(quote)
  end

  def as_json
    @quote_calculator.calculate_quote
  end
end
