require 'fraction'

class Ratio
  attr_accessor :numerator, :denominator
  
  def initialize(n = 1.0, d = 1.0)
    unless d == 0
      @numerator, @denominator = n, d
    else
      raise IllegalDenonimator, "Denominator cannot be zero"
    end
  end
  
  def to_s
    "#{@numerator}:#{@denominator}"
  end
  
  def reduce!
   results = (@numerator.to_f / @denominator.to_f).fraction
   @numerator = results[0]
   @denominator = results[1]
  end
  
  def to_f
    @numerator.to_f / @denominator.to_f
  end
  
  def to_percent
    to_f * 100.0
  end
end