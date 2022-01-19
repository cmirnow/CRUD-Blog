require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should validate presence of title' do
    category = Category.new
    category.valid?
    expect(category.errors.messages[:title]).to include "can't be blank"
  end

  it { is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(70) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to have_one_attached(:image) }
end
