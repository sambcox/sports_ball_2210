require "./lib/team"

RSpec.describe Team do
  it 'exists' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team).to be_a Team
  end

  it 'has an empty roster by default' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.roster).to eq([])
  end

  it 'can count the roster' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.player_count).to eq(0)
  end

  it 'can add players to the roster' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Clayton Kershaw" , 1416666, 12)
    player_2 = Player.new("Mookie Betts" , 2386363, 132)
    team.add_player(player_1)
    team.add_player(player_2)

    expect(team.roster).to eq([player_1, player_2])
    
    expect(team.player_count).to eq(2)
  end

  it 'can tell if a player is short or long term' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Clayton Kershaw" , 1416666, 12)
    player_2 = Player.new("Mookie Betts" , 2386363, 132)
    player_3 = Player.new("Justin Turner", 1500000, 24)
    player_4 = Player.new("Walker Buehler", 604166, 12)
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.long_term_players).to eq([player_2])
    expect(team.short_term_players).to eq([player_1, player_3, player_4])
  end

  it 'can tell the total team value' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Clayton Kershaw" , 1416666, 12)
    player_2 = Player.new("Mookie Betts" , 2386363, 132)
    player_3 = Player.new("Justin Turner", 1500000, 24)
    player_4 = Player.new("Walker Buehler", 604166, 12)
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
  
    expect(team.total_value).to eq(375249900)
  end

  it 'combines the team details'  do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Clayton Kershaw" , 1416666, 12)
    player_2 = Player.new("Mookie Betts" , 2386363, 132)
    player_3 = Player.new("Justin Turner", 1500000, 24)
    player_4 = Player.new("Walker Buehler", 604166, 12)
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.details).to eq ({"total_value" => 375249900, "player_count" => 4})
  end

  it 'can tell the average player value' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Clayton Kershaw" , 1416666, 12)
    player_2 = Player.new("Mookie Betts" , 2386363, 132)
    player_3 = Player.new("Justin Turner", 1500000, 24)
    player_4 = Player.new("Walker Buehler", 604166, 12)
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
  
    expect(team.average_cost_of_player).to eq(93812475)
  end

  it 'can return the last names of all players in alphabetical order' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Clayton Kershaw" , 1416666, 12)
    player_2 = Player.new("Mookie Betts" , 2386363, 132)
    player_3 = Player.new("Justin Turner", 1500000, 24)
    player_4 = Player.new("Walker Buehler", 604166, 12)
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
  
    expect(team.players_by_last_name).to eq(["Buehler", "Betts", "Kershaw", "Turner"])
  end
end