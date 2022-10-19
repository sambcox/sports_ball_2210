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

    expect(team.long_term_players).to eq([player_2])
    expect(team.short_term_players).to eq([player_1, player_3, player_4])
  end
end