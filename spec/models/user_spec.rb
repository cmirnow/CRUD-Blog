require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is database authenticable' do
    user = User.create(
      email: 'user@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(user.valid_password?('password')).to be_truthy
  end

  it { should have_many(:visits).class_name('Ahoy::Visit') }
  it { should have_many(:events).class_name('Ahoy::Event') }
end
