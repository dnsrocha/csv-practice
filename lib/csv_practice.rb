require 'awesome_print'
require 'csv'

def get_all_olympic_athletes(filename)
  athletes = CSV.read(filename, headers: true)
  athletes.map do |athlete|
    {
        "ID" => athlete["ID"],
        "Name" => athlete["Name"],
        "Height" => athlete["Height"],
        "Team" => athlete["Team"],
        "Year" => athlete["Year"],
        "City" => athlete["City"],
        "Sport" => athlete["Sport"],
        "Event" => athlete["Event"],
        "Medal" => athlete["Medal"]
    }
  end
end

def total_medals_per_team(olympic_data)
  total_medals_per_team = {} #{"team name => medals"}
  total_medals = olympic_data.filter{ |hash| hash["Medal"] != "NA" }
  total_medals.each do |medal|
    team = medal["Team"]
    medal_count = total_medals_per_team[team]
    if medal_count.nil?
      medal_count = 1
    else
      medal_count += 1
    end
    total_medals_per_team[team] = medal_count
  end
  return total_medals_per_team
end

def get_all_gold_medalists(olympic_data)
  gold_medals = olympic_data.filter { |hash| hash["Medal"] == "Gold" }
  return gold_medals
end