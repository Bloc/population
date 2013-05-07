# Population

The idea of the project is to show how a computer can do large amounts of data for us. We are using a free zipcode database from this [site](http://federalgovernmentzipcodes.us/). The population data is old (2008).

There are a few parts to this script.

1. `Area` is a class to represent each of the locations within the csv.
2. `CSVReader` will read the csv and give a block for each of the rows in the csv.
3. `Setup` does all of the gluing by calling `CSVReader` and then creating a new `Area` for each row.
4. `Analytics` performs various "queries" on the data
5. `populations` is the main menu for the application.
