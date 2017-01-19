$latitute = 0
$longtitude = 0

class Rover

  attr_accessor :latitude, :longtitude, :x_axis, :y_axis, :directions

  def initialize (x,y,z)
    @x_axis = x
    @y_axis = y
    @direction = z.upcase
  end

  def read_instruction(directions)
    directions = directions.upcase.split(//)
    directions.each do |d|
      if d == "L" || d == "R"
        turn(d)
      else
        move
      end
    end
  end

  def move
    case @direction
      when "N"
        @y_axis += 1
      when "E"
        @x_axis += 1
      when "S"
        @y_axis -= 1
      when "W"
        @x_axis -= 1
    end
    output
    if @y_axis >= $latitude + 1 || @y_axis < 0
      "Error. You're out of bounds"
    elsif @x_axis >= $longtitude +1 || @x_axis < 0
      "Error. You're out of bounds"
    end
  end

  def turn(t)
    case @direction
      when "N"
        if t == "L"
          @direction = "W"
        elsif t == "R"
          @direction = "E"
        end
      when "E"
        if t == "L"
          @direction = "N"
        elsif t == "R"
          @direction = "S"
        end
      when "S"
        if t == "L"
          @direction = "E"
        elsif t == "R"
          @direction = "W"
        end
      when "W"
        if t == "L"
          @direction = "S"
        elsif t == "R"
          @direction = "N"
        end
      end
      output
  end
  def output
    puts "#{@x_axis} #{@y_axis} #{@direction}"
  end
end

puts "Enter plateau size:"
max = gets.gsub(/\s+/,"")
$longtitude = max[0].to_i
$latitude = max[1].to_i
puts "Longtitude is #{$longtitude} while latitude is #{$latitude}"

puts "Where is the rover now? (longtitude, latitude, then direction)"
direction = gets.gsub(/\s+/,"")
rover = Rover.new(direction[0].to_i, direction[1].to_i, direction[2].upcase)
rover.output

puts "Where do you want me to go?"
where = gets.gsub(/\s+/,"")
rover.read_instruction(where)

puts "The rover's final location is:"
rover.output

puts "Where is the second rover now? (longtitude, latitude, then direction)"
direction = gets.gsub(/\s+/,"")
rover = Rover.new(direction[0].to_i, direction[1].to_i, direction[2].upcase)
rover.output

puts "Where do you want me to go?"
where = gets.gsub(/\s+/,"")
rover.read_instruction(where)

puts "The rover's final location is:"
rover.output
