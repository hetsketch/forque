# frozen_string_literal: true

class Topic < ApplicationRecord
  validates :title, presence: true, length: { in: 25..100 }, uniqueness: true
  validates :text, presence: true, length: { in: 100..30_000 }, uniqueness: true
  validates :publish_date, presence: { message: 'The date must be given' }
  validates :author, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
