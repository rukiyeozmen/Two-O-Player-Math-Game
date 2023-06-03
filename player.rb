class Player
  attr_reader :name, :lives

  MAX_LIVES = 3

  def initialize(name)
    @name = name
    @lives = MAX_LIVES
  end

  def lose_life
    @lives -= 1
  end

  def score
    "#{lives}/#{MAX_LIVES}"
  end
end
