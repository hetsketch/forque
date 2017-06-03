# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'creates' do
    create :topic
  end
end
