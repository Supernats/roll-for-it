class Dice
  attr_reader :argv

  def initialize(argv)
    @argv = argv
  end

  def self.allowable_die
    [4, 6, 8, 10, 12, 20, 100]
  end

  def self.roll(argv)
    new(argv).roll(stringify: true)
  end

  def parsed
    @parsed || argv.split("d").reverse.reject(&:empty?).map(&:to_i)
  end

  def die
    parsed[0]
  end

  def count
    parsed[1] || 1
  end

  def roll(stringify: false)
    if !Dice.allowable_die.include?(die)
      puts "You can't roll a #{die}."
      return
    end

    results = Array.new(count).map { rand(die) + 1 }

    stringify ? results.join(", ") + "\n" : results
  end
end
