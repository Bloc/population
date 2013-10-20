It can be tough to find a good place to start when creating a new program. You have to think about the functionality as a whole, and decide where it makes the most sense to start coding. For the Population program, a good place to start is the `csv_reader.rb`. Before you can do much of anything with Population, you'll need data from the `csv` file, so `csv_reader.rb` is a logical place to start.

> Note: rather than copying the code, read the requirement and try to figure out how you would tackle the problem first.

## Creating the CSVReader Methods

### Initialize
Create a class named `CSVReader` with an `initialize` method that takes the name of a file and saves it to an instance variable named `@fname`. The `CSVReader` class should also have getter and setter methods for `fname`.

```ruby
class CSVReader
  
  attr_accessor :fname
  
  def initialize(filename)
    @fname = filename
  end
end
```

### Headers=
Create a `headers=` setter method. The `headers=` method should take a `String` and then convert the `String` into an `Array`. The `CSVReader` class should create getter and setter methods for `headers` as well:

```ruby
class CSVReader
  
  attr_accessor :fname, :headers
  
  def initialize(filename)
    @fname = filename
  end

  def headers=(header_str)
    @headers = header_str.split(',')
  end
end
```

The `headers=` method should also clean-up the argument by removing quotation marks and new-line characters if they exist. 

> Note: the reason for the clean-up is that when you present this data to a user, it should be without special characters. That is, rather than showing the user `"hello"`, you'd want to show them `hello`. This requires a bit of forward thinking, but it's always a good idea to keep the user in mind when you are designing your methods.

```ruby
class CSVReader
  
  attr_accessor :fname, :headers
  
  def initialize(filename)
    @fname = filename
  end

  def headers=(header_str)
    @headers = header_str.split(',')
    @headers.map! do |h|
    
      # remove quotes
      h.gsub!('"', '')

      # remove new line
      h.strip!
    end
  end
end
```

The `headers=` method should also convert strings to snake-case. In order to convert a string to snake-case, open the `String` class outside of the `CSVReader` class and add a method named `underscore`. This is a complicated method, and something that has probably been done before. We Googled this and found that someone has in fact [done this before](http://stackoverflow.com/questions/1509915/converting-camel-case-to-underscore-case-in-ruby). You can copy the code below into the `csv_reader.rb` (but remember to code it outside of the `CSVReader` class):

```ruby
class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end
```

This method is detailed in the Ruby on Rails [ActiveSupport](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-underscore) API.

Now that you have a valid `underscore` method, update the `headers=` method to use it to convert strings to snake-case:

```ruby
class CSVReader
  
  attr_accessor :fname, :headers
  
  def initialize(filename)
    @fname = filename
  end

  def headers=(header_str)
    @headers = header_str.split(',')
    @headers.map! do |h|

      # remove quotes
      h.gsub!('"', '')

      # remove new line
      h.strip!

      # convert to a symbol
      h.underscore.to_sym
    end
  end
end
```

### Create Hash
Create a method named `create_hash`. It should take an `Array` and then iterate over the `@headers` variable defined in the `headers=` method. As you iterate over the `@headers` collection, you'll want to track the position of the element in the collection. This can be done using the `each_with_index` method. This method should return a hash of valid headers.

```ruby
...
  def create_hash(values)
    h = {}
    @headers.each_with_index do |header, i|
    end
    h
  end
...
```

Remove quotes and new-line characters from the argument, and then populate a hash with the cleansed value:

```ruby
...
  def create_hash(values)
    h = {}
    @headers.each_with_index do |header, i|
      # remove new lines from the value
      value = values[i].strip.gsub('"', '')
      h[header] = value unless value.empty?
    end
    h
  end
...
```

## Assignment
Make sure you understand every line of code in this checkpoint. If you attempted to code the methods yourself, and approached the problem from a different perspective, please discuss it with your mentor. Regardless of your approach, push your code to Github and provide the relevant commit link in the assignment submission message.
