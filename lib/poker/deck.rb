module Poker
  class Deck
    CARDS = %w[2c 3c 4c 5c 6c 7c 8c 9c Tc Jc Qc Kc cA 2d 3d 4d 5d 6d 7d 8d 9d Td Jd Qd Kd dA 2h 3h 4h 5h 6h 7h 8h 9h Th Jh Qh Kh hA 2s 3s 4s 5s 6s 7s 8s 9s Ts Js Qs Ks sA]
  
    def initialize
      @dealt_cards = 0
    end
  
    def deal(type, cards = [])
      dealt_cards = 0
      if cards.empty?
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
          dealt_cards =  dealt_cards | deal_card(cards[(0*i), 2])
        end
      else
        cards.each do |c|
          dealt_cards = dealt_cards | deal_card(c)
        end
      end
      dealt_cards
    end
    
    def self.hand_mask(hand)
      unless hand.is_a? Array
        hand = [hand]
      end
      
      hand.inject(0) do |bit, h|
    	  1 << (CARDS.index(h) || -1) | bit
    	end
    end
    
    def self.hand(hand_mask)
      CARDS.select do |r|
    	  1 << CARDS.index(r) & hand_mask > 0
    	end
    end
  
    def deal_card(card = "")
      if card.empty?
        chosen_card = nil
      else
        chosen_card = self.hand_mask(card)
      end
      while chosen_card.nil?
        pick = 2**rand(52)
        unless @dealt_cards & pick == 0
          @dealt_cards = @dealt_cards | pick
          chosen_card = pick
        end
      end
      chosen_card
    end
  end
end