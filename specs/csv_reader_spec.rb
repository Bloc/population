require "./lib/csv_reader.rb"

describe "CSVReader" do
  describe "initalize" do
    it "saves the file name to fname" do
      c = CSVReader.new("./test.csv")
      c.fname.should eq("./test.csv")
    end
  end

  describe "headers=" do
    it "should convert headers" do
      c = CSVReader.new("./my_csv.csv")
      c.headers = "\"Zipcode\",\"ZipCodeType\",\"City\",\"State\"\n"
      c.headers.should eq([:zipcode, :zip_code_type, :city, :state])
    end
  end

  describe "create_hash" do
    it "should use headers and values to create hash" do
      c = CSVReader.new("./my_csv.csv")
      c.headers = "\"Zipcode\",\"City\",\"State\",\"EstimatedPopulation\"\n"
      hash = c.create_hash(["94102","SAN FRANCISCO","CA","16733"])
      resulting_hash = { 
        zipcode: "94102", 
        city: "SAN FRANCISCO", 
        state: "CA", 
        estimated_population: "16733" 
      } 
      hash.should eq(resulting_hash)
    end
  end
end