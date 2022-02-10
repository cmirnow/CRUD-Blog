require 'rails_helper'

RSpec.describe Slideshow, type: :model do
  it { is_expected.to have_many_attached(:images) }

  describe 'validates data column' do
    subject { described_class.new(options: options) }
    let(:valid_data) do
      {
        "resize_to_limit": [1, 2],
        "kuwahara": 'string',
        "polaroid": 1
      }
    end

    describe 'valid data' do
      let(:options) { valid_data }
      it { is_expected.to be_valid }
    end

    describe 'value type is invalid (case 1)' do
      let(:options) { valid_data.merge quality: 'string' }
      it { is_expected.not_to be_valid }
    end

    describe 'value type is invalid (case 2)' do
      let(:options) { valid_data.merge monochrome: 'array' }
      it { is_expected.not_to be_valid }
    end

    describe 'value type is valid' do
      let(:options) { valid_data.merge monochrome: true }
      it { is_expected.to be_valid }
    end

    describe 'missing a optional element' do
      let(:options) { valid_data.except :kuwahara }
      it { is_expected.to be_valid }
    end

    describe 'missing a necessary element' do
      let(:options) { valid_data.except :resize_to_limit }
      it { is_expected.not_to be_valid }
    end
  end
end
