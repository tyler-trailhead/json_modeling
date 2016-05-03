require "test_helper"

describe Showtimes do

  # Notice here symbols are treated as true values
  # You could also do vcr: true
  describe 'filtering' do#, :vcr do
    it "it should only fetch one good showtime", vcr: { record: :all } do
      VCR.insert_cassette('showtimes')
      showtimes = Showtimes.new(zip: 95240)
      filtered = showtimes.filter
      puts "="*45
      puts filtered.inspect
      puts "="*45
      assert_equal 1, filtered.length
    end

  end

  it "spec_name" do
    
  end
end
