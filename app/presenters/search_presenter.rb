require 'date'
class SearchPresenter

  attr_reader :view_start_date, :view_end_date
  
  def initialize(dates)
    @dates = dates
  end 
  
  def view_start_date 
    @dates[:start_date].to_date.strftime("%B %e, %Y")
  end
  
  def view_end_date 
    @dates[:end_date].to_date.strftime("%B %e, %Y")
  end
  
  def dangerous_days
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{url_start_date}&end_date=#{url_end_date}&api_key=#{ENV["NASA_API_KEY"]}")
    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects].map do |day, asteroid_data|
      asteroid_data.map do |asteroid|
        day if asteroid[:is_potentially_hazardous_asteroid]
      end
    end
  end

    def format_dangerous_day
      dangerous_days.compact.flatten.uniq.map do |day|
        day.to_s 
      end
    end

    def view_most_dangerous_day 
      format_dangerous_day.delete_if do |day|
        day.empty?
      end
    end

private 

  def url_start_date 
    Date.parse(@dates[:start_date])
  end

  def url_end_date 
    Date.parse(@dates[:end_date])
  end
end