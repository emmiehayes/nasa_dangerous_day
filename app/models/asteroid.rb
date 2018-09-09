class Asteroid 
  attr_reader :name, :id, :day

  def initialize(object)
    @name = object[1].first[:name]
    @neo_ref_id = object[1].first[:neo_reference_id]
    @object = object
  end

  def day 
    @object.first.to_s.to_date.strftime("%B %e, %Y")
  end

  def dangerous?
    @object[1].first[:is_potentially_hazardous_asteroid]
  end
end