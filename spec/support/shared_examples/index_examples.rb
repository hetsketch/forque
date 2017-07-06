# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'index_examples' do
  it { is_expected.to have_http_status(:ok) }
  it { is_expected.to render_template(:index) }
end
