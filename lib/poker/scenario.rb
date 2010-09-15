class Scenario
  def self.run(game, scenario_runs = 10000)
    outcomes = []
    scenario_runs.times do
      game.deal_flop
      game.deal_turn
      game.deal_river
      outcomes << game.showdown
    end
  end
end