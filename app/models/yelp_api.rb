class YelpAPI

  require 'yelp'

    
  def initialize
    @client = Yelp::Client.new({
             consumer_key: Rails.application.secrets.consumer_key,
            consumer_secret: Rails.application.secrets.consumer_secret,
            token: Rails.application.secrets.token,
            token_secret: Rails.application.secrets.token_secret
      })
    @params = {term: "cheap eats", sort: 2, limit: 10, radius_filter: 1000}
  end

  def get_top_ten(school)
    coords = school.get_coords_from_location
    search_coords = {}
    search_coords[:longitude] = coords["lng"]
    search_coords[:latitude] = coords["lat"]
    top_ten = @client.search_by_coordinates(search_coords, @params)
  end










end