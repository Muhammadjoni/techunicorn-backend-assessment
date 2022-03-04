class Doctor < ApplicationRecord
  has_many :patients, through: :appoinments
  has_many :appointments, dependent: :destroy
  belongs_to :clinic_admin
  belongs_to :appoinments

  validates :last_name, presence: true
  validates :profession, presence: true
  validates :appoinments

end
