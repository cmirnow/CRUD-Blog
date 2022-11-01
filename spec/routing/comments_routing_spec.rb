require 'rails_helper'

RSpec.describe 'routes for Comments', type: :routing do
  it 'routes admin/comments to the admin::comments controller' do
    expect(get('admin/comments')).to route_to('admin/comments#index')
  end
end
