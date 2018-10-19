class Message < ApplicationRecord
    def initialize(date_sent, contents)
        has_one :user
        belongs_to :chatroom
        @date_sent = date_sent
        @contents = contents
    end
end
