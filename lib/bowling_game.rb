class BowlingGame
  attr_accessor :throws

  def initialize game
    self.throws = game.split('')
  end

  def score
    score_chart.inject(:+)
  end

  def score_chart
    throws.each_with_index.map do |throw, idx|
      throw_score throw, idx
    end
  end

  def throw_score throw, idx
    if spare?(throw)
      (10 - bare_score(idx - 1)) + bare_score(idx + 1)
    elsif strike?(throw)
      10 + bare_score(idx + 1) + bare_score(idx + 2)
    else
      bare_score idx
    end
  end

  def bare_score idx
    throw = self.throws[idx]
    return 10 if strike?(throw)
    if spare?(throw)
      previous_score = bare_score(idx - 1)
      return 10 - previous_score
    end
    throw.to_i
  end

  protected
  def strike? throw
    throw == 'X'
  end

  def spare? throw
    throw == '/'
  end
end