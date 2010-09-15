module Poker
  class Game
    attr_reader :players, :pot, :deck, :community_cards
  
    def initialize(args = {})
      @deck = Poker::Deck.new
      @players = []
      @pot = 0
      @community_cards = []
      
      unless args[:hands].nil?
        args[:hands].each do |hand|
          player = Poker::Player.new
          player.cards << @deck.deal(:hole_cards, hand)
          @players << player
        end
      end
    end
  
    def flop
      @community_cards << @deck.deal(:flop)
    end
  
    def turn
      @community_cards << @deck.deal(:turn)
    end
  
    def river
      @community_cards << @deck.deal(:river)
    end
  
    def showdown
      # stub - compare hands and determine who wins
    end
  end
end