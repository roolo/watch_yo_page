# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Watchings', type: :request do
  let(:current_user) { FactoryGirl.create :yuser }

  describe 'GET /watchings' do
    it 'works! (now write some real specs)' do
      get watchings_path(username: current_user.username)
      expect(response).to have_http_status(200)
    end
  end
end
