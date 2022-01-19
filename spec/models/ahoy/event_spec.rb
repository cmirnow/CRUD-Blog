require 'rails_helper'

RSpec.describe Ahoy::Event, type: :model do
  it { is_expected.to belong_to(:visit) }
  it { is_expected.to belong_to(:user).optional(:true) }
end
