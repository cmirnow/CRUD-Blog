require 'rails_helper'

RSpec.describe 'Analytics', type: :request do
  describe 'GET /index' do
    before do
      get '/analytics'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
