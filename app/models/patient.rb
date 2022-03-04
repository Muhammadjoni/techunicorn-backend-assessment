class Patient < ApplicationRecord
  belongs_to :doctor, through: :appointment
  belongs_to :appointment
  belongs_to :clinic_admin
  belongs_to :user

  validates :first_name, presence: true

end
