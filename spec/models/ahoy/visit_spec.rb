require 'rails_helper'

RSpec.describe Ahoy::Visit, type: :model do
  it { is_expected.to have_many(:events).class_name('Ahoy::Event') }
  it { is_expected.to belong_to(:user).optional(:true) }
end
