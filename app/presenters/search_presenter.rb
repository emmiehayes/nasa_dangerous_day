class SearchPresenter

  attr_reader :start_date, :end_date
  
  def initialize(dates)
   @dates = dates
  end 

  def start_date 
    binding.pry
    @dates
  end

  def end_date 
  end
end