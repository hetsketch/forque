# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before { create :user }

  it 'creates user' do
    # is_expected.to be User
    # User.create(valid_user_attributes)
    # p User.first
    # User.create(username: 'alex', email: 'fjsdklj@gmail.com')
    # is_expected.to be User
    # subject
    p User.first
  end
end
