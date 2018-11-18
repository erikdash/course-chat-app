require 'date'
class MessagesController < ApplicationController
  def create
    @message = Message.new(contents: params.require(:session)[:contents])#, chatroom: params.require(:chatroom))
    users_controller = UsersController.new
    @message.user = current_user#session[:user]
    @message.date_sent = DateTime.now
    chatroom = Chatroom.find_by(id: session[:current_room]["id"])
    chatroom.messages << @message
    #@message.id = Messages.count - 1 # ex: after creating first message, count = 1, so id = 0
    unless @message.save!
      flash.now[:error] = "Could not create message"
    end
  end

  # Returns all messages in specified chatroom,
  # in order of date sent ascending (oldest at beginning)
  # def all_in_room
  #   @room_messages = Message.find_by(chatroom: params[:chatroom]).order(:date_sent)
  # end

  def user_params # ?
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
