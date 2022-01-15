require 'rails_helper'

RSpec.describe Ahoy::Visit, type: :model do
  it { should have_many(:events).class_name('Ahoy::Event') }
  it { should belong_to(:user).optional(:true) }
end
