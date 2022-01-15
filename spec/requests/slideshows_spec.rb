require 'rails_helper'

RSpec.describe 'Slideshows', type: :request do
  describe 'GET /index' do
    before do
      get '/slideshow'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
