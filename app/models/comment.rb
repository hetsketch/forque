# frozen_string_literal: true

class Comment < ApplicationRecord
  # Scopes

  # Constants

  # Enums

  # Associations
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  # Validations
  validates :text, :author, :posted_date, :commentable, presence: true

  # Callbacks

  # Uploaders
end
