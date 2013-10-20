## The Population Program
Over the subsequent checkpoints you'll create a fully functioning Ruby program. You've had some academic exposure to Ruby methods and coding, but practicing these things in a realistic context will provide a deeper understanding of core programming concepts.

Follow the steps below on your command line, assuming you already created a `code` directory in the Command Line checkpoint.

```bash
$ cd code
$ mkdir population
$ cd population
$ git init
$ touch README.md
$ touch population.rb
$ mkdir lib
$ cd lib
$ touch csv_reader.rb
$ touch area.rb
$ touch setup.rb
$ touch analytics.rb
```

## Your Mission
The goal of this checkpoint is to create a program with which you can find data within a `.csv` file. The `.csv` file you will be using is from the [Federal Government Zip Codes site](http://federalgovernmentzipcodes.us/). Download [this file](http://federalgovernmentzipcodes.us/free-zipcode-database.csv) and move it to the `population` directory.

> A `.csv` file is a file with values separated by commas. It stands for "comma separated value". It is an efficient way to encode tabular data in a text-based file. The first row of a `.csv` file usually contains the names of each column (separated by commas). Each subsequent line of the `.csv` file represents a row in a table. Each value, or column, is separated by a comma.

Your program should be able to find how many zip codes exist in the United States. It should be able to find which zip code is the smallest or largest, return how many zip codes are in a given state, and let you search for zip codes.

## Designing the Program
As a developer, you'll constantly think of different approaches you can take to solve problems. There are always many ways to skin the proverbial cat, but you should give a problem enough thought to design an efficient and maintainable solution. For example, you could write one file to accomplish all of the tasks outlined in this checkpoint. That being said, it helps to separate code into different files, depending on it's purpose. Designing your solution in a modular fashion such as this will make the code much easier to maintain, and possibly, much more DRY.

Here's a proposed design, based on the files you created above:

* `population.rb` will be the file you execute on the command line. It will create a menu system and interpret a user's input;
* `csv_reader.rb` will read the CSV file;
* `area.rb` will be a class who's instance represents one row in the `.csv` file;
* `setup.rb` will call the `CSVReader` class and create an `Area` instance for each row;
* `analytics.rb` is where you the fun happens. It will have an `Array` of `area` instances which you can loop over and extract various bits of information.

## Next Steps
The following checkpoints detail the various files in the Population program. Rather than coding them in-browser, you should code them directly in Sublime, so you can easily run and test the program locally. Open the Population project in Sublime from your command line, and you'll have access to all of the `.rb` files you created:

```bash
$ cd ..
$ pwd #=> should be the population directory
$ subl .
```

## Assignment
This is a challenging set of exercises. It will be helpful to stay active with your mentor and work through the problems collaboratively. Your mentor will assist when you get stuck, of course.

> Note: we have created a [solution](https://github.com/Bloc/population) for you. Follow the directions on the `README` to install and run it locally. We encourage you to try it yourself first, and work through the problems with your mentor.

Initialize a new local repo, create a `README` file and push your code to Github. Provide the relevant commit link in the assignment submission message.
