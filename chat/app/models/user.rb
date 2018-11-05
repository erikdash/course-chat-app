class User < ApplicationRecord
  include Clearance::User
  has_many :messages
  has_many :starred_chat_rooms
  has_many :notifications
end
