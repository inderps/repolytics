class Committer
  attr_accessor :name

  def initialize name
    @name = name
  end

  def self.all
    [new("megha"), new("ips"), new("kaimal")]
  end
end