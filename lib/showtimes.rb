require_relative 'gracenote_client'

class Showtimes
  
  def initialize(zip:)
    @zip = zip
    @date = Date.today.to_s
  end

  def filter
    showtimes.select{|s|
      s.quality_rating.value > 3.0
        # FIXME
        # s.showtimes.any?{|t| t.dateTime > "7pm" }
    }
  end

  def showtimes
    @showtimes ||= GracenoteClient.local_theaters(start_date: @date, zip: @zip) 
  end
end
