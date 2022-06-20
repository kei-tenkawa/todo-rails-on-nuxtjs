class Department < ApplicationRecord
  has_many :sections
  has_many :users
end
