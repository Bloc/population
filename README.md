# Population

The purpose of this program is to demonstrate how we can use code to efficiently analyze large amounts of data. We are using an extract from a free zipcode database from the [Federal Government Zip Codes](http://federalgovernmentzipcodes.us/) site in this program. The population data is from 2008.

There are five parts to this program:

1. `area.rb` is a class to represent each of the locations within the csv.
2. `csv_reader.rb` will read the `csv` file and return a hash object for each of the rows in the `csv` file.
3. `setup.rb` calls the `CSVReader` class and creates an `Area` instance for each row.
4. `analytics.rb` performs various queries on the data.
5. `population.rb` is the main menu for the application.

To install and run the program: (if you are a Bloc student, make sure you are in your `code` directory)

```bash
$ pwd #=> should be your code directory
$ git clone git@github.com:Bloc/population.git
$ cd population
$ ruby population.rb
```

You'll also need to install RSpec to run the specs:

```bash
$ gem install rspec
$ pwd #=> should be your population directory
$ rspec specs #=> runs the tests
```

