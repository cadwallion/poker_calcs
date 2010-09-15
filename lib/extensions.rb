class String
  def to_poker_range
    HandRange.new(self)
  end
end