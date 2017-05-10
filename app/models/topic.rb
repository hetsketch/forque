class Topic < ApplicationRecord
  validates :title, presence: true, length: { in: 25..100, message: 'Title should be more than 25 and less than 100 characters' }, uniqueness: true
  validates :text, presence: true, length: { in: 100..30_000, message: 'Title should be more than 100 characters' }, uniqueness: true
  validates :publish_date, presence: { message: "must be given please" }
  
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
