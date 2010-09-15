class String
  def to_poker_range
    HandRange.new(self)
  end
end

class Integer
  def choose(m)
    return (self.fact / (m.fact * (self - m).fact))
  end

  def fact
    (2..self).inject(1) { |f, n| f * n }
  end
end