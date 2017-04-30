class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, presence: true, length: {in: 5..100}
  validates :username, presence: true, uniqueness: true, length: {in: 3..20}
  validates :first_name, length: {in: 3..30, message: 'First name should be between 3 and 30 characters'}, allow_nil: true, allow_blank: true
  validates :last_name, length: {in: 3..30, message: 'First name should be between 3 and 30 characters'}, allow_nil: true, allow_blank: true
  validates :position, length: {in: 10..50, message: 'First name should be between 10 and 50 characters'}, allow_nil: true, allow_blank: true
  validates :city, length: {in: 10..50, message: 'First name should be between 10 and 50 characters'}, allow_nil: true, allow_blank: true
  validates :bio, length: {in: 10..300, message: 'First name should be between 10 and 300 characters'}, allow_nil: true, allow_blank: true
  
  has_one :company
  has_many :topics
end
