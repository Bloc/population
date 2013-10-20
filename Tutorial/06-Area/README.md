> Note: rather than copying the code, read the requirement and try to figure out how you would tackle the problem first.

## Creating the Area Class

### Initialize
In the `area.rb` file, create a class named `Area` that can be initialized with a hash that can be used to assign attributes. Each attribute should have a default value as well. Account for the following attributes:

* `zipcode`, with a default of 0;
* `estimated_population`, with a default of 0;
* `city`, with a default of "n/a"; and 
* `state`, with a default of "n/a"

```ruby
class Area
  def initialize(hash)
    @zipcode = hash[:zipcode].to_i || 0
    @estimated_population = hash[:estimated_population].to_i || 0
    @city = hash[:city] || "n/a"
    @state = hash[:state] || "n/a"
  end
end
```

The `initialize` method should also create getters and setters for the attributes:

```ruby
class Area
  
  attr_accessor :zipcode, :estimated_population, :city, :state

  def initialize(hash)
    @zipcode = hash[:zipcode].to_i || 0
    @estimated_population = hash[:estimated_population].to_i || 0
    @city = hash[:city] || "n/a"
    @state = hash[:state] || "n/a"
  end
end
```

### Description
Create a method named `to_s` to describe the area. The description returned should be an interpolated `String` including the values assigned in the `initialize` method. For example, if all four attributes are assigned, the `String` returned from `to_s` should incorporate all of them. Review the [specs](https://github.com/Bloc/population/blob/master/specs/area_spec.rb) in `specs/area_spec.rb` for more detail.

```ruby
class Area

  attr_accessor :zipcode, :estimated_population, :city, :state

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
```

## Assignment
Make sure you understand every line of code in this checkpoint. If you attempted to code the methods yourself, and approached the problem from a different perspective, please discuss it with your mentor. Regardless of your approach, push your code to Github and provide the relevant commit link in the assignment submission message.