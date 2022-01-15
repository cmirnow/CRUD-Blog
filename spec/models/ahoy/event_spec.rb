require 'rails_helper'

RSpec.describe Ahoy::Event, type: :model do
  it { should belong_to(:visit) }
  it { should belong_to(:user).optional(:true) }
end
