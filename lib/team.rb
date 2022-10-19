class Team
  attr_reader :location, :team_name
  def initialize(location, team_name)
    @location = location
    @team_name = team_name
  end
end