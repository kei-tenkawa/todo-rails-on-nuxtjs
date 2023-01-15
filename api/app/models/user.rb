class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks

  belongs_to :department
  belongs_to :section
end
