module Poker
  class Player
    attr_reader :stack
    attr_accessor :cards
  
    def initialize(args = {})
      @stack = args[:stack].nil? ? 0 : args[:stack]
      @cards = args[:cards].nil? ? [] : args[:cards]
    end
  end
end