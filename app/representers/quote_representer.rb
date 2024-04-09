class QuoteRepresenter
  def initialize(quote)
    @quote = quote
  end

  def as_json
    {
      value_to_be_insured: @quote.value_to_be_insured,
      annual_premium: @quote.annual_premium,
      monthly_premium: @quote.monthly_premium
    }
  end

end
