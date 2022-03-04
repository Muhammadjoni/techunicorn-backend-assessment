class Patient < ApplicationRecord
  belongs_to :doctor, through: :appointment
  belongs_to :appointment
  belongs_to :clinic_admin

  validates :first_name, presence: true

end
