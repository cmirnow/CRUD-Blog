require 'rails_helper'

RSpec.describe 'routes for Categories', type: :routing do
  it 'routes admin/categories to the admin::categories controller' do
    expect(get('admin/categories')).to route_to('admin/categories#index')
  end
  it 'routes /categories/category_name to the categories controller' do
    expect(get('/categories/category_name')).to route_to(
      controller: 'categories',
      action: 'show',
      id: 'category_name'
    )
  end
end
