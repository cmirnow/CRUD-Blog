require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  describe 'GET /index' do
    before do
      get '/contacts/index'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
