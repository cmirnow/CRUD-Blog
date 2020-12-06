class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: 'Invalid email' }
  validates :subject, presence: true
  validates :message, presence: true
end
