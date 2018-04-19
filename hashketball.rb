require 'pry'

def game_hash 
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        },
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        }
      }
    }
  }
end
  
def num_points_scored(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
    
  if home_players.keys.include?(name)
    home_players[name][:points]
  else
    away_players[name][:points]
  end
end

def shoe_size(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
    
  if home_players.keys.include?(name)
    home_players[name][:shoe]
  else
    away_players[name][:shoe]
  end
end

def player_by_number(number)
  new_hash = []
  
  game_hash.each do |team_key, team|
    # team_key => :home, :away
    # {.... :players}
    new_hash << team[:players] 
  end
    binding.pry
end

player_by_number(33)
# => "Brendan Haywood"

def team_colors(team)
  colors = []
  game_hash.each do |location, team_data|
    if team_data.values.include?(team)
      colors << team_data.values[1]
    end
  end
  colors.flatten
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data.values[0]
  end
  
  names
end

def player_numbers(team)
  jersey_numbers = []
  
  game_hash.each do |location, team_attributes|
    team_attributes.each do |key, value|
      if value == team
        players_hash = team_attributes.values[2]
        players_hash.each do |player, stats|
          jersey_numbers << stats[:number]
        end
      end
    end
  end
  
  jersey_numbers
end

def player_stats(name)
  game_hash.each do |location, team_attributes|
    team_attributes.each do |key, value|
      if key == :players
        value.each do |player, stats| 
          if player == name
            return stats
            #binding.pry
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  players = home_players.merge(away_players)
  shoe_size = []
  shoe_owner = []
  
  players.each do |name, stats|
    shoe_size << stats[:shoe]
    shoe_owner << name
  end
  
  big_shoe = shoe_owner[shoe_size.rindex(shoe_size.max)]
  players[big_shoe][:rebounds]
  #binding.pry
end

def most_points_scored

end

def winning_team
  
end

def player_with_longest_nam

end

def long_name_steals_a_ton?
  
end
