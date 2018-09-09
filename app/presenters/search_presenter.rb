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
end