class Message < ApplicationRecord
  has_one :user
  has_one :chatroom
end
