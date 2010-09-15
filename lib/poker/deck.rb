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
  
  def deal(type, cards = "")
    dealt_cards = []
    case type
    when :hole_cards
      deal_count = 2
    when :flop
      deal_count = 3
    when :turn
      deal_count = 1
    when :river
      deal_count = 1
    end
    deal_count.times do |i|
      dealt_cards << deal_card cards[(0*i), 2]
    end
    dealt_cards.size > 1 ? dealt_cards : dealt_cards[0] 
  end
  
  def deal_card(card = "")
    if card.nil? || card.blank?
      card = @cards.pop
    else
      @cards.delete(card)
    end
    card
  end
end
