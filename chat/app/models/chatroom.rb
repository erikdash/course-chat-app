class Chatroom < ApplicationRecord
  has_many :messages
  has_many :files_uploaded
end
