require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/patient_repository'

erika = Patient.new(name: 'Erika', cured: true)
soren = Patient.new(name: 'Soren')
hafid = Patient.new(name: 'Hafid')
ayhem = Patient.new(name: 'Ayhem')
savi = Patient.new(name: 'Savi')

vip = Room.new(capacity: 2)
general = Room.new(capacity: 20)

# vip.add_patient(erika)
# vip.add_patient(soren)
# general.add_patient(hafid)

# p vip
# erika.room.add_patient(soren)

# p vip
# create room repo first then patients
csv_file_path = 'data/patients.csv'
patient_repository = PatientRepository.new(csv_file_path)

# patient_repository.create(ayhem)
# patient_repository.create(savi)
p patient_repository
