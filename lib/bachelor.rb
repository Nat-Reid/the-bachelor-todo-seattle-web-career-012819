require 'pry'

def all_contestants(data)
  contestants = []
  data.each_value do |seasons_contestants|
    contestants << seasons_contestants
  end
  #binding.pry
  contestants.flatten
end

def get_first_name_of_season_winner(data, season)
  data[season].find{|contestant| contestant["status"] == "Winner"}["name"].split[0]
end

def get_contestant_name(data, occupation)
  all_contestants(data).find{|contestant| contestant["occupation"] == occupation}["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).select{|contestant| contestant["hometown"] == hometown}.size
end

def get_occupation(data, hometown)
  all_contestants(data).find{|contestant| contestant["hometown"] == hometown}["occupation"]
end

def get_average_age_for_season(data, season)
  total_age = 0.0
  data[season].each{|contestant| total_age += contestant["age"].to_i}
  (total_age / data[season].size).round
end
