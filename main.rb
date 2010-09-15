# Runs poker hand scenarios to calculate equity
require File.dirname(__FILE__) + '/lib/poker'
require File.dirname(__FILE__) + '/lib/extensions'

#{ }"22+, A5s, A7o+, AsKc".to_poker_range.to_s

game = Poker::Game.new(:hands => ["AsAd", "2s2d"])

results = Poker::Scenario.run(game)