require 'rails_helper'

RSpec.describe 'Get RSS feed', type: :request do
  it 'returns an RSS feed' do
    get '/feed.rss', as: :rss
    expect(assigns(@posts)).to be # Post.all is truthy (not nil or false)
    expect(response).to have_http_status(:success)
    expect(response.content_type).to eq('application/rss+xml; charset=utf-8')
  end
end
