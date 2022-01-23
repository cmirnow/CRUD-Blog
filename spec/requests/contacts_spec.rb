require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  describe 'GET /contacts/index' do
    before do
      get '/contacts/index'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe ContactsController, type: :controller do
  subject { controller.weather('48.864716', '2.349014') }

  it 'should return these keys' do
    expect(subject).to include(
      # 'name' => 'Paris'
      'base' => 'stations',
      'cod' => 200,
      'timezone' => 3600
    )
  end
  it 'includes clouds key' do
    expect(subject).to have_key('clouds')
  end
end
