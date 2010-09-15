class HandRange
  POCKET_PAIR = /^(A|K|Q|J|T|[2-9])\1(\+)?$/
  SUITED = /^((A|K|Q|J|T|[2-9]){2})s(\+)?$/
  OFF_SUIT = /^((A|K|Q|J|T|[2-9]){2})o(\+)?$/
  SPECIFIC_CARDS = /^((A|K|Q|J|T|[2-9])(s|d|c|h)){2}$/
  
  def initialize(arg)
    @hands = arg.gsub(" ","").split(",")
  end
  
  def to_s
    @hands.each do |hand|
      case hand
      when POCKET_PAIR
        puts "pocket #{Card::RANKS[$1] + ($1 == '6' ? 'es' : 's')}" + ($2.nil? ? "" : " and higher")
      when SUITED
        puts "#{Card::RANKS[$1[0]]}-#{Card::RANKS[$1[1]]} suited" + ($3.nil? ? "" : " and higher")
      when OFF_SUIT
        puts "#{Card::RANKS[$1[0]]}-#{Card::RANKS[$1[1]]} off-suit" + ($3.nil? ? "" : " and higher")
      when SPECIFIC_CARDS
        puts "#{Card::RANKS[hand[0]]} of #{Card::SUITS[hand[1]]}, #{Card::RANKS[hand[2]]} of #{Card::SUITS[hand[3]]}"
      else
        puts "bad read"
      end
    end
  end
end