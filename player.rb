class Player

  attr_accessor :lives, :gold_coins, :score, :health_points

  def initialize
    @lives = 5
    @gold_coins = 0
    @score = 0
    @health_points = 10
  end

  def do_battle
    @health_points -= 1
      if @health_points == 0
        @lives -= 1
        @health_points = 10
      end
      if @lives == 0
        restart
      end
    end

  def restart
    if @lives == 0
      initialize
    end
  end

  def level_up
    @lives += 1
  end

  def collect_treasure(amount)
    @gold_coins += amount
    if @gold_coins >= 10
      temp = @gold_coins / 10
      @gold_coins = @gold_coins - temp * 10
      @score += temp
    end
    if @score >= 10
      score_level_up = @score / 10
      score_level_up.times {level_up}
      @score = @score - score_level_up * 10
    end
  end


end
