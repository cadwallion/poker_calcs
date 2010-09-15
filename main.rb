# Builds a Parser to turn poker strings into relevant objects
# This includes specific hands (AsKc, 9dTd) as well as hand ranges (AKs, JJ+)
# 
# Examples: 
# * 22+ => pocket deuces and higher
# * AKs => ace-king suited
# * JJ+ => pocket jacks and higher
# * QJs+ => queen-jack suited and higher
# * 59o+ => five-nine off-suit and higher
# 

require File.dirname(__FILE__) + '/lib/poker'
require File.dirname(__FILE__) + '/lib/extensions'

#{ }"22+, A5s, A7o+, AsKc".to_poker_range.to_s

game = Game.new(:hands => ["AsAd", "2s2d"])

game.run_scenarios
game.output_results