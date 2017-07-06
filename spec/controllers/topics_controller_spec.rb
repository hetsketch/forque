# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  context '#index' do
    subject { get :index }

    it 'renders index page' do
      is_expected.to render_template(:index)
    end
  end
end
