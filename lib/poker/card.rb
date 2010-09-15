module Poker
  class Card
    attr_reader :rank, :suit

    RANKS = { 
      "2" => "deuce", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", 
      "8" => "eight", "9" => "nine", "T" => "ten", "J" => "jack", "Q" => "queen", "K" => "king", "A" => "ace"
    }

    SUITS = { "s" => "spades", "c" => "clubs", "d" => "diamonds", "h" => "hearts" }

    def initialize(args)
      case args.class
      when String
        @rank = args[0]
        @suit = args[1]
      when Hash
        @rank = args[:rank]
        @suit = args[:suit]
      end
    end

    def to_s
      "#{@rank.upcase}#{@suit.downcase}"
    end
  end
end
