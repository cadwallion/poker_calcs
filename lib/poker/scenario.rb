module Poker
  class Scenario
    def self.run(game, scenario_runs = 10000)
      outcomes = []
      scenario_runs.times do
        game.flop
        game.turn
        game.river
        outcomes << game.showdown
      end
      outcomes
    end
  end
end