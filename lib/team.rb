class Team
  attr_reader :location, :team_name, :roster
  def initialize(location, team_name)
    @location = location
    @team_name = team_name
    @roster = []
  end

  def player_count
    roster.length
  end

  def add_player(player_added)
    @roster << player_added
  end

  def long_term_players
    roster.find_all do |player|
      player.contract_length > 24
    end
  end

  def short_term_players
    roster.find_all do |player|
      player.contract_length <= 24
    end
  end

  def total_value
    roster.sum do |player|
      player.total_cost
    end
  end
  
  def details
    details = {
      "total_value" => self.total_value,
      "player_count" => self.player_count
    }
  end
end