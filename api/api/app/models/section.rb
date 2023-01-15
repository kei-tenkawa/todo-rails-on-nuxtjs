class Section < ApplicationRecord
  has_many :users
  belongs_to :department
end
