require 'rails_helper'

RSpec.describe 'Admin::Posts', type: :request do
  subject { get '/posts' }
  it(:status) { should eq 200 }
end
