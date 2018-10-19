class User < ApplicationRecord
    def initialize(email, nickname, password, permissions)
        has_many :messages
        @email = email
        @nickname = nickname
        @password = password
        @notifications = []
        @starred_chat_rooms = []
        @permissions = permissions
    end
end
