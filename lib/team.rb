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
      "total_value" => total_value,
      "player_count" => player_count
    }
  end

  def average_cost_of_player
    average = total_value / player_count
    "$#{average.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
  end

  def players_by_last_name
    roster.map do |player|
      player.last_name
    end.sort.join(", ")
  end
end