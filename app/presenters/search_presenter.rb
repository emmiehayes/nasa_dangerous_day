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

  def asteroids
    service.near_earth_objects.map do |object|
      Asteroid.new(object) 
    end
  end

  def most_dangerous_day 
    asteroids.keep_if do |asteroid|
      return asteroid.day if asteroid.dangerous?
    end
  end

  private
  attr_reader :dates

  def service
    NasaService.new(dates)
  end
end