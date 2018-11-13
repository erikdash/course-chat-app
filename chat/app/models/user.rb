class User < ApplicationRecord
  include Clearance::User
  has_many :messages
  has_many :chatrooms # starred chatrooms
  has_many :notifications

  def confirm_email
    self.email_confirmed_at = Time.current
    save
  end
end
