class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
    render template: "chatrooms/new"
  end

  # creates a chat_room
  def create
    @chatroom = Chatroom.new(chat_room_name: params.require(:name))
    @chatroom.date_created = DateTime.now
    @chatroom.number_of_stars = 0
    session[:current_room] = @chatroom
    if @chatroom.save
      # render template: "chatrooms/new"
      render @chatroom.chat_room_name
    end
  end

  # returns all chatrooms
  def index
    # @all_rooms = Chatroom.all
    @messages = Message.order(created_at: :asc)
  end

  # returns all messages in specific chatroom
  def show
    @messages = Message.order(created_at: :asc)
    @current_uri = request.path
    chatroom = @current_uri.delete "/chatrooms/"
    puts "CURRENT URI: #{@current_uri}"
    @chatroom = Chatroom.find_by(chat_room_name: chatroom)
    # @room_messages = @chatroom.messages.all
    session[:current_room] = @chatroom

    # KEEP COMMENTED
    #chat_room_path_url(chatroom: @chatroom.chat_room_name)
    # render "chatrooms/show"#@chatroom.chat_room_name
  end

  # checks to see if any new messages have been sent since last check
  # def check_new_messages
  #
  # end
end
