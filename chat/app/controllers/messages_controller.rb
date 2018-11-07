require 'date'
class MessageController < ApplicationController
  def new
    @message = Message.create(contents: params.require(:contents), chatroom: params.require(:chatroom))
    @message.user = user_params # ? session[:current_user_id]
    @message.date_sent = DateTime.now
    @message.id = Messages.count - 1 # ex: after creating first message, count = 1, so id = 0
    unless @message.save
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
