require_relative 'lib/setup'
require_relative 'lib/analytics'


class Population
  attr_accessor :analytics

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
  end

  def menu
    system 'clear'
    puts "Pupulation Menu"
    puts "---------------"
    @analytics.options.each do |opt|
      puts "#{opt[:menu_id]}. #{opt[:menu_title]}"
    end
  end

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
        puts "Exiting"
      else
        print "\nHit enter to continue "
        gets
      end
    end
  end
end

p = Population.new
p.run
