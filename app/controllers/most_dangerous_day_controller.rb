class MostDangerousDayController < ApplicationController
  def index
    @presenter = SearchPresenter.new(search_params)
  end

  private 

  def search_params 
    params.permit(:start_date, :end_date)
  end
end
