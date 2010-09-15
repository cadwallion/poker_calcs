class Deck
  def initialize
    @cards = []
    Card::RANKS.each_key do |rank|
      Card::SUITS.each_key do |suit|
        @cards << Card.new({ :rank => rank, :suit => suit })
      end
    end
    @cards.shuffle!
  end
  
  def deal_card
    @cards.pop
    @cards.shuffle!
  end
end
