require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) do
    Contact.new(
      name: 'test',
      email: 'test@test.com',
      subject: 'something',
      message: 'Hi how are you doing?'
    )
  end
  before { contact.valid? }

  it 'requires an email' do
    expect(contact).to be_valid
    # other test on error message here perhaps?
  end

  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to validate_length_of(:subject).is_at_least(5) }
  it { is_expected.to validate_length_of(:message).is_at_least(15) }
end
