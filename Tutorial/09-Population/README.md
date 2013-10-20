> Note: rather than copying the code, read the requirement and try to figure out how you would tackle the problem first.

## Creating the Population Class
The `population.rb` file will be the file that runs the entire program.

### Initialize
The `Population` class will need to access methods from `Setup` and `Analytics`. You can use require_relative` declarations for this. The `initialize` method should call `Setup` and assign the areas from it to a variable named `areas`. It should also create an `@analytics` instance variable assigned to an initialized instance of `Analytics`, given the `areas` variable created from `Setup`:

```ruby
require_relative 'lib/setup'
require_relative 'lib/analytics'


class Population
  attr_accessor :analytics

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
  end
end
```

### Menu
The `menu` method should create a basic user interface (UI). It should also iterate over `@analytics.options` and print each option's `menu_id` and `menu_title`.

> Note: type `system 'clear'` to clear the terminal window, thus creating a fresh UI for a user.

```ruby
  ...
  def menu
    system 'clear'
    print "Population Menu"
    print "---------------"
    @analytics.options.each do |opt|
      print "#{opt[:menu_id]}. #{opt[:menu_title]}"
    end
  end
  ...
```

### Run
The `run` method should control the overall user flow. It should allow users to enter menu items, prompt them to continue and allow them to exit the program. The `run` method can accomplish these things by using a `while` loop to iterate over a collection, based on a condition. If the user selects "Exit", the loop should stop and exit. 

> Note: when you have a branching scenario such as this, pseudo-code can be helpful. Pseudo-code is basically code, written out in plain English, so that you can construct the logic before worrying about the actual syntax. Consider the following pseudo-code for the `run` method:

```ruby
def run
  stop = false
  while stop != :exit do
    run the menu method
    grab the choice from the user
    call run on analytics with the choice
    based on what that returns either
      exit
    or
      ask user to hit enter (this pauses the loop)
    end
  end
end
```

If you don't ask the user to hit enter, the loop will iterate again and the `menu` will clear the screen before the user has a chance to read it. Here's the actual Ruby syntax we created from the pseudo-code:

```ruby
  ...
  def run
    stop = false

    while stop != :exit do
      # run the menu
      self.menu
      # grab the choice
      print "Choice: "
      choice = gets.strip.to_i
      # run their choice
      stop = @analytics.run(choice)
      if stop == :exit
        print "Exiting"
      else
        print "\nHit enter to continue "
        gets
      end
    end
  end
  ...
```

## Getting User Input

In a command line program such as this, the way to get user input is to use the `gets` method, as you've seen from our examples. You can use the `print` method to prompt the user, and then gather their entry with `gets`. For example:

```ruby
print "Enter your name: "
name = gets.strip
```
    
It can be helpful to call the `strip` method on `gets` because the data retrieved from `gets` will contain a new line character that's not needed for your program.

## Additional Tips

Make sure you handle variable types properly. When you get input from a user in a command line program, the input will always come in as a string. Depending on how you use the data from `gets`, you may need to convert it to another data type.

This program can be run by typing:

```bash
$ ruby population.rb
```

Place the following code at the end of the `population.rb` (outside of the class declaration) to enable the program to run:

```ruby
class Population
  ...
end

p = Population.new
p.run
```

## Assignment
Make sure you understand every line of code in this checkpoint. If you attempted to code the methods yourself, and approached the problem from a different perspective, please discuss it with your mentor. Regardless of your approach, push your code to Github and provide the relevant commit link in the assignment submission message.
