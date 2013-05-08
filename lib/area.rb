class Area
  attr_accessor :record_number
  attr_accessor :zipcode
  attr_accessor :zip_code_type
  attr_accessor :city
  attr_accessor :state
  attr_accessor :location_type
  attr_accessor :lat
  attr_accessor :long
  attr_accessor :xaxis
  attr_accessor :yaxis
  attr_accessor :zaxis
  attr_accessor :world_region
  attr_accessor :country
  attr_accessor :location_text
  attr_accessor :location
  attr_accessor :decommisioned
  attr_accessor :tax_returns_filed
  attr_accessor :estimated_population
  attr_accessor :total_wages
  attr_accessor :notes
     
  def initialize(hash)
    @zipcode = hash[:zipcode].to_i || 0
    @estimated_population = hash[:estimated_population].to_i || 0
    @city = hash[:city] || "n/a"
    @state = hash[:state] || "n/a"
  end

  def to_s
    "#{city}, #{state} #{zipcode} has #{estimated_population} people."
  end
end
