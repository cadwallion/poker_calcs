module Poker
  class Game
    attr_reader :players, :deck, :community_cards
  
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
      @community_cards = @community_cards | @deck.deal(:flop)
    end
  
    def turn
      @community_cards = @community_cards | @deck.deal(:turn)
    end
  
    def river
      @community_cards = @community_cards | @deck.deal(:river)
    end
  
    def showdown
      final_holdings = []
      @players.each do |player|
        final_holdings << (player.cards | @community_cards)
      end
      Poker::Result.determine(final_holdings)
    end
  end
end