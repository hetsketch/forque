# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :text, :author, :start_time, :end_time, presence: true
  validates :title, length: { in: 25..100 }, uniqueness: true
  validates :text, length: { in: 100..10_000 }, uniqueness: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :users, through: :participants
end
