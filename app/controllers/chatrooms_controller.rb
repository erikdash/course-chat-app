class ChatroomsController < ApplicationController
  # returns all chatrooms
  def index
    @all_rooms = Chatroom.all
  end

  # returns all messages in specific chatroom
  def show
    @room = Chatroom.find_by(id: params.require(:id))
    @room_messages = @room.messages.all
  end
end
