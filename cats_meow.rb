class Cat

  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  def eats_at
    if @meal_time > 12
      "#{@meal_time-12} PM"
    elsif @meal_time == 12
      "#{@meal_time} PM"
    else
    "#{@meal_time} AM"
    end
  end

  def meow
    "My name is #{@name} and I eat #{@preferred_food} at #{eats_at}"
  end

attr_accessor :name, :preferred_food, :meal_time

end

cat1 = Cat.new("Hugo", "Iams", 12)
cat2 = Cat.new("Boss", "Friskies", 15)

puts cat1.meow
