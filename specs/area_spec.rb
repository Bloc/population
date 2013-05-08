require "./lib/area.rb"

describe "Area" do
  describe "initialize" do
    it "sets the default values" do
      h = {
        zipcode: "94102",
        city: "SAN FRANCISCO", 
        state: "CA", 
        estimated_population: "16733" 
      }
      a = Area.new(h)
      a.zipcode.should eq(94102)
      a.city.should eq("SAN FRANCISCO")
      a.estimated_population.should eq(16733) 
    end
  end

  describe "to_s" do
    it "returns a clean string" do
      h = {
        zipcode: "94102",
        city: "SAN FRANCISCO", 
        state: "CA", 
        estimated_population: "16733" 
      }
      a = Area.new(h)
      a.to_s.should eq("SAN FRANCISCO, CA 94102 has 16733 people.")
    end
  end
end