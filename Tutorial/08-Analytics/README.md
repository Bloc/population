> Note: rather than copying the code, read the requirement and try to figure out how you would tackle the problem first.

## Creating the Analytics Class
The `Analytics` class will leverage the work you completed in the previous exercises. It's purpose is to query and return information from the `csv` file you loaded.

### Initialize
The `initialize` method should take a collection of `areas` and set it to an `@areas` instance variable. The `Analytics` class should create getters and setters for `options`:

```ruby
class Analytics
  attr_accessor :options

  def initialize(areas)
    @areas = areas
  end
end
```

### Set Options
The `set_options` method should create an instance variable named `@options` which should hold a `menu`. A `menu` should be an array of hashes. Each `menu` hash should have three keys: `menu_id`, `menu_title` and `method`. `menu_id` should be the number that shows up in the menu, `menu_title` should be the display text in the menu, and `method` should be the method called if it's option is picked by the user. The `set_options` method should also be called from `initialize`.

> Note: example `menu_titles` are included for you below - you'll create the methods for these later in the checkpoint.

```ruby
class Analytics
  attr_accessor :options

  def initialize(areas)
    @areas = areas
    set_options
  end

  def set_options
    @options = []
    @options << { menu_id: 1, menu_title: 'Areas count', method: :how_many }
    @options << { menu_id: 2, menu_title: 'Smallest Population (non 0)', method: :smallest_pop }
    @options << { menu_id: 3, menu_title: 'Largest Population', method: :largest_pop }
    @options << { menu_id: 4, menu_title: 'How many zips in California?', method: :california_zips }
    @options << { menu_id: 5, menu_title: 'Information for a given zip', method: :zip_info }
    @options << { menu_id: 6, menu_title: 'Exit', method: :exit }
  end
end
```

### Run
The `run` method should take a number as an argument. It should pick the option and run the associated method. It should also allow the user to exit to program and raise an appropriate error when the user picks an invalid option.

```ruby
  ...
  def run(choice)
    opt = @options.select {|o| o[:menu_id] == choice }.first
    if opt.nil?
      print "Invalid choice"
    elsif opt[:method] != :exit
      self.send opt[:method]
      :done
    else
      opt[:method]
    end
  end
  ...
```

### Menu Item Methods
The following methods should correlate to menu items:

The `how_many` method should print a string with the number of areas and population codes:

```ruby
  ...
  def how_many
    print "There are #{@areas.length} areas"
  end
  ...
```

The `smallest_pop` method should return the city and state with the smallest population, not including the ones with zero:

```ruby
  ...
  def smallest_pop
    sorted = @areas.sort do |x, y| 
      x.estimated_population <=> y.estimated_population
    end
    smallest = sorted.drop_while { |i| i.estimated_population == 0 }.first
    print "#{smallest.city}, #{smallest.state} has the smallest population of #{smallest.estimated_population}"
  end
  ...
```

The `largest_pop` method should return the city and state with the largest population:

```ruby
  ...
  def largest_pop
    sorted = @areas.sort do |x, y| 
      x.estimated_population <=> y.estimated_population
    end
    largest = sorted.reverse.drop_while { |i| i.estimated_population == 0 }.first
    
    print "#{largest.city}, #{largest.state} has the largest population of #{largest.estimated_population}"
  end
  ...
```

The `california_zips` method should return the number of population codes in California:

```ruby
  ...
  def california_zips
    c = @areas.count { |a| a.state == "CA" }
    print "There are #{c} zip code matches in California"
  end
  ...
```

The `zip_info` method takes a population code as an argument and returns all available information about it. It should use the `to_s` method on the `area` object:

```ruby
  ...
  def zip_info
    print "Enter zip: "
    zip = gets.strip.to_i
    zips = @areas.select { |a| a.zipcode == zip }
    unless zips.empty?
      print ""
      zips.each { |z| print z }
    else
      print "Zip not found"
    end
  end
  ...
```

## Assignment
Make sure you understand every line of code in this checkpoint. If you attempted to code the methods yourself, and approached the problem from a different perspective, please discuss it with your mentor. Regardless of your approach, push your code to Github and provide the relevant commit link in the assignment submission message.
