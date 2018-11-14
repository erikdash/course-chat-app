class ChatroomsController < ApplicationController
  # returns all chatrooms
  def index
    @all_rooms = Chatroom.all
  end

  # returns all messages in specific chatroom
  def show
    @room = Chatroom.find_by(chat_room_name: params.require(:chat_room_name))
    @room_messages = @room.messages.all
  end
end
