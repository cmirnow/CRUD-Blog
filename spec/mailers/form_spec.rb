require 'rails_helper'

RSpec.describe FormMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  let(:form) do
    Contact.create!(
      name: 'test',
      email: 'test@example.com',
      subject: 'subject',
      message: 'Bluh bluh bluh.'
    )
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send an email' do
    FormMailer.new_form_email(form).deliver_now
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  it 'sends to the correct receiver' do
    FormMailer.new_form_email(form).deliver_now
    expect(ActionMailer::Base.deliveries.first.to.first).to eq('info@masterpro.ws')
  end

  it 'should set the subject correctly' do
    FormMailer.new_form_email(form).deliver_now
    expect(ActionMailer::Base.deliveries.first.subject).to eq('Hurray! You got a new form!')
  end
end
