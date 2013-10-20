> Note: rather than copying the code, read the requirement and try to figure out how you would tackle the problem first.

## Creating the Setup Class

### Initialize
Create a `Setup` class with an `initialize` method that creates a new `CSVReader` instance using the `./free-zipcode-database.csv` file, and assigns it to a local variable. The `Setup` class should also create getters and setters for an `areas` collection:

```ruby
class Setup
  
  attr_accessor :areas

  def initialize
    csv = CSVReader.new("./free-zipcode-database.csv")
  end
end
```

The `initialize` method should create an empty instance variable named `@areas` which stores a collection of areas extracted from the `csv` file.

> Hint: you'll need to use the `read` method from the `CSVReader` class. You have not created this method yet, but it's good practice to include it as a placeholder.

```ruby
class Setup

  attr_accessor :areas

  def initialize
    csv = CSVReader.new("./free-zipcode-database.csv")

    @areas = []
    csv.read do |item|
      @areas << Area.new(item)
    end
  end
end
```

The `initialize` method should return itself:

```ruby
class Setup

  attr_accessor :areas
  def initialize
    csv = CSVReader.new("./free-zipcode-database.csv")

    @areas = []
    csv.read do |item|
      @areas << Area.new(item)
    end

    self

  end
end
```

### Required Classes

The `Setup` class should be able to access methods from the `csv_reader` and `area` classes:

```ruby
require_relative 'csv_reader'
require_relative 'area'

class Setup
  ...
end
```

> As you know from the Advanced Classes checkpoint, `require` lets Ruby know which other files (and methods) we want access to. `require_relative` makes sure that Ruby looks at the path relative to our current file.

### Read
Go back to the `csv_reader.rb` file and write a `read` method that creates a new, read-only, instance of the Ruby `File` class.

> Ruby has a `File` [class](http://ruby-doc.org/core-1.9.3/File.html) that you can call methods on. The `new` method takes arguments that should specify the file name and location, as well as the permission to be imposed on the file. To open a file with read-only permission, you can call `new` on the `File` class and pass in the file name and an permissions option. The "r" option enforces read-only permission on a file.

```ruby
class CSVReader
  ...
  def read
    f = File.new(@fname, 'r')
  end
  ...
end
```

Grab a line from the `File` instance, and set it to the `headers` attribute:

```ruby
class CSVReader
  ...
  def read
    f = File.new(@fname, 'r')
    
    # Grab the headers
    self.headers = f.readline
  end
  ...
end
```

Until you reach the end of the `File` instance, loop over the collection of lines and set each line to a variable that is subsequently added to a hash. The hash needs to be returned to the block it was called from.

> Note: if you remember from coding the placeholder for `read` above, the `read` method needs to take a block argument. As you know from the Blocks checkpoint, to invoke a block in Ruby you call `yield`. 

> Another note: you can instruct the computer to check if it's reached the end of a file by using the `eof?` method.

```ruby
class CSVReader
  ...
  def read
    f = File.new(@fname, 'r')
    
    # Grab the headers
    self.headers = f.readline

    # Loop over the lines
    while (!f.eof? && next_line = f.readline)
      values = next_line.split(',')
      hash = create_hash(values)
      yield(hash)
    end
  end
  ...
end
```

## Assignment
Make sure you understand every line of code in this checkpoint. If you attempted to code the methods yourself, and approached the problem from a different perspective, please discuss it with your mentor. Regardless of your approach, push your code to Github and provide the relevant commit link in the assignment submission message.
