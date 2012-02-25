%w(json httparty).each { |dependency| require dependency }

class Stratagems
  CACHE_TIME = 10

  def self.all
    if @strat.nil? || Time.now > (@last_download + CACHE_TIME)
      @last_download = Time.now
      @strat = get_obst
    end
    @strat
  end

  def self.get_obst
    data = HTTParty.get("https://raw.github.com/pfarrell/obst/master/stratagems.flat").body
    data.split("\n").map do |strat|
      Stratagem.new(strat)
    end
  end
end
  

class Stratagem
  attr_reader :gem

  def initialize gem
    @gem= gem
  end
end
