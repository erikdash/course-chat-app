class Chatroom < ApplicationRecord
    def initialize(chat_room_name, num_users_in_chat, date_created, number_of_stars)
        has_many :messages
        @chat_room_name = chat_room_name
        @num_users_in_chat = num_users_in_chat
        @date_created = date_created
        @files_uploaded = []
        @number_of_stars = number_of_stars
        @messages = []
    end
end
