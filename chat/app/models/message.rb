class Message < ApplicationRecord
    has_one :user
    belongs_to :chatroom
end
