class HighScores

  def initialize(scores)
    @scores = scores
    @cache = {}
  end

  attr_reader :scores

  def personal_top_three
    @scores.max(3)
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

end
