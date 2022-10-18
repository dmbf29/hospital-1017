class Room
  class CapacityReachedError < StandardError; end

  def initialize(attributes = {})
    @capacity = attributes[:capacity] # integer
    @patients = [] # an array of INSTANCES
  end

  def full?
    @capacity == @patients.length
  end

  def add_patient(patient)
    raise CapacityReachedError, 'Room is full' if full?

    @patients << patient
    # self refers what the method was called on
    patient.room = self
  end
end
