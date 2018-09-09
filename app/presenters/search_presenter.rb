class SearchPresenter
  attr_reader :start_date, :end_date
  
  def initialize(dates)
    @dates = dates
  end

  def start_date 
    @dates[:start_date].to_date.strftime("%B %e, %Y")
  end 

  def end_date 
    @dates[:end_date].to_date.strftime("%B %e, %Y")
  end
  
  def asteroids_in_date_range
    raw_asteroids.map do |asteroid|
      asteroid
    end
  end
  
  def most_dangerous_day 
    raw_asteroids.keep_if do |raw_asteroid|
      return raw_asteroid.day if raw_asteroid.dangerous?
    end
  end
  
  private
  attr_reader :dates
  
  def service
    NasaService.new(dates)
  end

  def raw_asteroids
    service.near_earth_objects.map do |object|
      Asteroid.new(object) 
    end
  end
end