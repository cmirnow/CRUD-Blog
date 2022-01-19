require 'rails_helper'

RSpec.describe Comment do
  describe 'validations' do
    subject(:comment) { Comment.new }
    before { comment.valid? }

    %i[post body commenter].each do |attribute|
      it "should validate presence of #{attribute}" do
        expect(comment.errors.messages[attribute]).to include "can't be blank"
      end
    end
  end

  it { is_expected.to validate_length_of(:body).is_at_least(3).is_at_most(999) }
  it { is_expected.to validate_length_of(:commenter).is_at_least(3).is_at_most(15) }
  it { is_expected.to belong_to(:post) }
end
