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
end