require 'rails_helper'

RSpec.describe Slider, type: :model do
  it { is_expected.to have_many_attached(:images) }
end
