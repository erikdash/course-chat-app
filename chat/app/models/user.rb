class User < ApplicationRecord
  include Clearance::User
  has_many :messages
  has_many :chatrooms
  has_many :notifications
end
