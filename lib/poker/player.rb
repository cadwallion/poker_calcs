module Poker
  class Player
    attr_reader :stack
    attr_accessor :cards
  
    def initialize(args = {})
      @stack = args[:stack] || 0
      @cards = args[:cards] || 0
    end
    
    def hole_cards
      Deck.hand(@cards)
    end
    
  end
end