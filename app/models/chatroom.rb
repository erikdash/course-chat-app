class Chatroom < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :users
#  has_many :files_uploaded
  # $new_messages = []
  # @session_new_messages = []
end
