class Contact < ApplicationRecord
  validates :name, length: { minimum: 3 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :subject, length: { minimum: 5 }
  validates :message, length: { minimum: 15 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email id message name subject updated_at]
  end
end
