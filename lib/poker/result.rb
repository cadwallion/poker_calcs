module Poker
  class Result
    def self.determine(holdings)
      holdings.each do |h|
        0.upto(12) do |n|
          if h[n] == 1
            3.times do |i|
              count += h[n+(i*13)] 
            end
            # TODO: we've picked up the count of the card, now to flag pair+sets+quads
          end 
        end
      end
    end
  end
end