class ClinicAdmin < ApplicationRecord
  has_many :patients, dependent: :destroy
  has_many :doctors, dependent: :destroy
  has_many :appoinments


end
