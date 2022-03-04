class Appointment < ApplicationRecord
  has_many :doctors
  has_many :patients
  belongs_to :clinic_admin
  belongs_to :user

end
