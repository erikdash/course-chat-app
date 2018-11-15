class Chatroom < ApplicationRecord
  has_many :messages
  has_many :files_uploaded
  # $new_messages = []
  # @session_new_messages = []
end
