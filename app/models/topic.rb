# frozen_string_literal: true

class Topic < ApplicationRecord
  # Scopes
  scope :recently_added, -> { order(publish_date: :desc) }

  # Constants

  # Enums

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many   :comments, as: :commentable
  # Validations
  validates :title, presence: true, length: { in: 10..100 }, uniqueness: true
  validates :text, presence: true, length: { in: 100..30_000 }, uniqueness: true
  validates :publish_date, presence: { message: 'The date must be given' }
  validates :author, presence: true

  # Callbacks

  # Uploaders

  # add comments
  # add comments counter
end
