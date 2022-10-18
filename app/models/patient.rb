class Patient
  attr_reader :name
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @room = attributes[:room] # an instance of a room
    @cured = attributes[:cured] || false # boolean
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end
end
