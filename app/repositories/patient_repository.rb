require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = [] # instances of patients
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(patient)
    # give the patient an id
    patient.id = @next_id
    # after using an id, increment by 1, setup the next id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # CSV -> everything is a string@
      # convert any nonstrings, before creating instance
      attributes[:id] = attributes[:id].to_i
      attributes[:cured] = attributes[:cured] == 'true'
      p attributes
      # we need turn room_id as a string -> room instance
      # we ask the room repository for an instance and give the ID (as an integer)
      attributes[:room] = @room_repository.find(attributes[:room_id].to_i)
      @patients << Patient.new(attributes)
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # first we need to add the headers
      csv << ['id', 'name', 'cured']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end
end
