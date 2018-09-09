class NasaService
  def initialize(dates)
    @dates = dates
  end

  def near_earth_objects
    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects]
  end

  def response
    conn.get("neo/rest/v1/feed?start_date=#{url_start_date}&end_date=#{url_end_date}&api_key=#{ENV["NASA_API_KEY"]}")
  end

  private
  attr_reader :dates

  def conn
    Faraday.new("https://api.nasa.gov/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def url_start_date 
    Date.parse(@dates[:start_date])
  end

  def url_end_date 
    Date.parse(@dates[:end_date])
  end
end