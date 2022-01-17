require 'rails_helper'

RSpec.describe 'Admin::Users', type: :request do
  # render_views
  let(:user) { User.create!(email: 'admin@example.com', password: 'password') }

  before(:each) do
    sign_in user
  end

  #   describe 'edit' do
  #     it 'renders user form' do
  #       get "/admin/admins/#{user.id}/edit"
  #       expect(assigns(:user)).to eq user
  #     end
  #   end

  describe 'update' do
    it 'updates user' do
      patch "/admin/admins/#{user.id}", params: { id: user, user: { email: 'user@example.com' } }
      user.reload
      expect(user.email).to eq 'user@example.com'
    end
  end
end
