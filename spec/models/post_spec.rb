require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { Post.new }
  before { post.valid? }

  %i[title category].each do |attribute|
    it "should validate presence of #{attribute}" do
      expect(post.errors.messages[attribute]).to include "can't be blank"
    end
  end

  it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(70) }
  it { is_expected.to validate_length_of(:description).is_at_least(4).is_at_most(160) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to have_many_attached(:images) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
end
