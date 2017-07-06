# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:event) { create(:event) }

  context '#index' do
    subject { get :index }

    include_examples 'index_examples'

    it 'contains event' do
      expect(Event).to receive(:all)

      subject
    end
  end

  context '#edit' do
    subject { get :edit, params: { id: event.id } }

    it { is_expected.to render_template(:edit) }
    it { is_expected.to have_http_status(:ok) }
    it 'contains event to edit' do
      expect(Event).to receive(:find)

      subject
    end
  end
end
