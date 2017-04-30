class Company < ApplicationRecord
  
  validates :name, presence: true, uniqueness: true, length: {in: 2..50}
  validates :city, presence: true, length: {in: 10..50}
  validates :bio, presence: true, length: {in: 100..500}
  
end
