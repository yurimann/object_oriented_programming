class Paperboy

  attr_accessor :name
  attr_reader :earnings, :experience

  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0
  end

  def quota
    50 + (@experience / 2)
  end

  def deliver(start_address, end_address)
    papers = end_address - start_address + 1.0

      if start_address > end_address
        "Values are not valid"
      end
      if papers >= quota
        money =  (quota * 0.25) + (papers - quota) * 0.5
      else
        money = papers * 0.25 - 2
      end
        @experience += papers
        @earnings += money
        return money
    end

    def report
      "I'm #{@name}, I've delivered #{@experience} papers and I've earned #{@earnings} so far!"
    end


end
