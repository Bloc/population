class Area
  attr_accessor :zipcode
  attr_accessor :city
  attr_accessor :state
  attr_accessor :estimated_population
     
  def initialize(hash)
    @zipcode = hash[:zipcode].to_i
    @estimated_population = hash[:estimated_population].to_i
    @city = hash[:city]
    @state = hash[:state]
  end

  def to_s
    "#{city}, #{state} #{zipcode} has #{estimated_population} people."
  end
end
