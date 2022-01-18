require 'rails_helper'

RSpec.describe 'Admin::Categories', type: :request do
  let(:user) { User.create!(email: 'admin@example.com', password: 'password') }
  let(:category) { Category.create!(title: 'bluhbluhbluh') }

  before(:each) do
    sign_in user
  end

  describe 'edit' do
    it 'renders category' do
      get "/admin/categories/#{category.title}/edit"
      expect(assigns(:category)).to eq category
    end
  end

  describe 'update' do
    it 'updates category' do
      patch "/admin/categories/#{category.title}", params: {
        id: category, category: {
          title: 'new-title',
          description: 'Description'
        }
      }

      category.reload
      expect(category.title).to eq 'new-title'
      expect(category.description).to eq 'Description'
    end
  end
end
