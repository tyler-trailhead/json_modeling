require 'faraday'
require 'json'
require 'map'
require_relative 'movie'

class GracenoteClient
  
  API_KEY = "ysrwrae9fztyq43ah3sq6pk3"
  BASE_URL = "http://data.tmsapi.com/"

  def self.local_theaters(start_date:, zip:)
    params = {
      'api_key' => API_KEY,
      'startDate' => start_date, 
      'zip' => zip
    }
    conn = Faraday.new(:url => BASE_URL)
    res = conn.get("/v1.1/movies/showings/", params)
    # TODO handle errors
    # TODO get vcr test working!
    if res.status == 200
     data = Map.new(JSON.parse(res.body)) 
     return data.map{|d| Movie.new(d) }
    end
  end
end
