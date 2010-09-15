class Game
  attr_reader :players, :pot, :deck, :community_cards
  
  def initialize(args = {})
    @deck = Deck.new
    unless args[:hands].nil?
      args[:hands].each do |hand|
        player = Player.new
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