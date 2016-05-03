require 'virtus'
class QualityRating
  include Virtus.model
  attribute :ratingsBody, String
  attribute :value, Float
end

class Theatre
  include Virtus.model
  attribute :id, String
  attribute :name, String 
end

class Showtime
  include Virtus.model
  attribute :theatre, Theatre
  attribute :dateTime, DateTime # tz appears to be local to theater's timezone
end

class Movie
  include Virtus.model
  attribute :title, String
  attribute :genres, Array[String]
  attribute :qualityRating, QualityRating
  attribute :advisories, Array[String]
  attribute :showtimes, Array[Showtime]

  def quality_rating
    @qualityRating
  end
end






