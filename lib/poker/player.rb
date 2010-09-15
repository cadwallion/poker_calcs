class Player
  attr_reader :cards, :stack
  
  def initialize(args = {})
    @stack = args[:stack] unless args[:stack].nil?
    @cards = args[:cards] unless args[:cards].nil?
  end
end