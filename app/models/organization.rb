class Organization
  attr_reader :name

  def initialize(org)
    @name = org[:name]
  end
  
end