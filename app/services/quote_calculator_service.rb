class QuoteCalculatorService
  def initialize(quote)
    @value_to_be_insured = quote.value_to_be_insured
  end

  def calculate_quote
    {
      value_to_be_insured: @value_to_be_insured,

      premium: [
        aluguel_padrao: {
          annual_premium: calculate_annual_premium("Aluguel padrão"),
          monthly_premium: calculate_monthly_premium("Aluguel padrão"),
          coverage: displays_coverage("Aluguel padrão")
        },

        aluguel_pro: {
          annual_premium: calculate_annual_premium("Aluguel pro"),
          monthly_premium: calculate_monthly_premium("Aluguel pro"),
          coverage: displays_coverage("Aluguel pro")
        }
      ]
    }
  end

  def calculate_annual_premium(plan_name)
    @value_to_be_insured * Plan.find_by(name: plan_name).rate * 12
  end

  def calculate_monthly_premium(plan_name)
    @value_to_be_insured * Plan.find_by(name: plan_name).rate
  end

  def displays_coverage(plan_name)
    Plan.find_by(name: plan_name).coverage.split(',')
  end
end
