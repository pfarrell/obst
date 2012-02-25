%w(json httparty).each { |dependency| require dependency }

class Stratagems
  
  def self.get_obst
    data = HTTParty.get("https://raw.github.com/pfarrell/obst/master/stratagems.flat").body
    data.map do |strat|
    puts strat.inspect
  end
end
  

class Stratagem
  attr_reader :strat

  def initialize strat
    @strat = strat
  end
end
