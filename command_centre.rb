require './mars_rover.rb'

class Command

  def initialize
    Rover.set_plateau
    choices
  end

  def collision


  end

  def choices
    while true
      print_main_menu
      decision = gets.to_i
      call_option(decision)
    end
  end

  def print_main_menu
    puts "What would you like to do?"
    puts "1) Add rover"
    puts "2) Move rover"
    puts "3) Report rover locations"
    puts "4) Exit"
  end

  def call_option(decision)
    case decision
      when 1
        puts "Where is the rover now? (longtitude, latitude, then direction)"
        direction = gets.gsub(/\s+/,"")
        rover = Rover.new(direction[0].to_i, direction[1].to_i, direction[2].upcase)
        rover.output
        Rover.new
      when 2
        puts "Input ID of rover to move:"
          Rover.output
          id = gets.chomp.to_i

        puts "Please input directions (l or r for turning, m to move)"
          where = gets.gsub(/\s+/,"")
          Rover.read_instruction(id, where)
          Rover.output

      when 3
        Rover.output
      when 4
        puts "Have a nice day!"
        exit
    end
  end
end





test = Command.new
