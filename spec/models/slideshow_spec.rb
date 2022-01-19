require 'rails_helper'

RSpec.describe Slideshow, type: :model do
  it { is_expected.to have_many_attached(:images) }
end
