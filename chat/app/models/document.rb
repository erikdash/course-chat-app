class Document < ApplicationRecord
    def initialize(document_name, date_uploaded, size)
        belongs_to :chatroom # chat_room
        has_one :user # uploaded_by
        @document_name = document_name
        @date_uploaded = date_uploaded
        @size = size # in bytes
    end
end
