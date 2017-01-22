
class Rover
  @@latitute = 0
  @@longtitude = 0
  @@rovers = []
  @@rover_id = 1
  attr_accessor :latitude, :longtitude, :x_axis, :y_axis, :direction
  attr_reader :rover_id

  def self.set_plateau
    puts "Enter plateau size"
    puts "Enter latitude size:"
    width = gets.to_i
    @@longtitude = width
    puts "Enter longtitude size:"
    height = gets.to_i
    @@latitude = height
    puts "Longtitude is #{@@longtitude} while latitude is #{@@latitude}"
  end

  def initialize (x,y,z)
    @x_axis = x
    @y_axis = y
    @direction = z.upcase
    @rover_id = @@rover_id
    @@rover_id += 1
    @@rovers << self
  end

  def self.read_instruction(id, directions)
    @@rovers.each do |rover|
      if rover.rover_id == id
        directions = directions.upcase.split(//)
        directions.each do |d|
          if d == "L" || d == "R"
            turn(id, d)
          else
            move(id, d)
          end
        end
      end
    end
  end

  def display
    @@rovers.each do |rover|
      puts "#{rover.rover_id}: Rover#{rover.rover_id}"
    end
  end

  def self.move(id, directions)
    @@rovers.each do |rover|
      if rover.rover_id == id
        case rover.direction
          when "N"
            checker_y = rover.y_axis + 1
          when "E"
            checker_x = rover.x_axis + 1
          when "S"
            checker_y = rover.y_axis - 1
          when "W"
            checker_x = rover.x_axis - 1
        end
        if @@longtitude + 1 >= rover.y_axis || rover.y_axis <= -1
          puts "Error. Rover out of bounds"
          "Error. You're out of bounds"
        elsif rover.x_axis >= @@latitude + 1 || rover.x_axis <= -1
          puts "Error. Rover out of bounds"
          "Error. You're out of bounds"
        else
          rover.y_axis = checker_y
          rover.x_axis = checker_x
        end
      end
    end
  end

  def self.turn(id, directions)
    @@rovers.each do |rover|
      if rover.rover_id == id
        case rover.direction
          when "N"
            if directions == "L"
              rover.direction = "W"
            elsif directions == "R"
              rover.direction = "E"
            end
          when "E"
            if directions == "L"
              rover.direction = "N"
            elsif directions == "R"
              rover.direction = "S"
            end
          when "S"
            if directions == "L"
              rover.direction = "E"
            elsif directions == "R"
              rover.direction = "W"
            end
          when "W"
            if directions == "L"
              rover.direction = "S"
            elsif directions == "R"
              rover.direction = "N"
            end
        end
      end
    end
  end

  def self.output
    @@rovers.each do |rover|
      puts "Rover ID [#{rover.rover_id}] Latitude #{rover.x_axis} Longtitude #{rover.y_axis} Facing #{rover.direction}"
    end
  end

  def self.plateau_size
    puts "#{@@longtitude} #{@@latitude}"
  end
end

test1 = Rover.new(2,2,"S")
test2 = Rover.new(1,2,"N")
test3 = Rover.new(3,3,"W")
