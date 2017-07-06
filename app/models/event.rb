# frozen_string_literal: true

class Event < ApplicationRecord
  # Scopes
  scope :passed, -> { where('end_time < ?', Time.now) }
  scope :future, -> { where('start_time > ?', Time.now) }
  # Constants

  # Enums

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :participants, dependent: :destroy

  # Validations
  validates :title, :text, :author, :start_time, :end_time, presence: true
  validates :title, length: { in: 5..100 }, uniqueness: true
  validates :text, length: { in: 100..10_000 }, uniqueness: true

  # Callbacks

  # Uploaders
  mount_uploader :photo, PhotoUploader
end
