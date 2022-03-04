class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :doctors, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :clinic_admins, dependent: :destroy
  has_many :appointments, dependent: :destroy
  validates :first_name, presence: true
end
