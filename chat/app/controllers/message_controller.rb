require 'date'
class MessageController < ApplicationController
  def new
    @message = Message.new(params.require(:contents, :chatroom))
    @message.user = session[:current_user_id]
    @message.date_sent = DateTime.now
    @message.id = Messages.count - 1 # ex: after creating first message, count = 1, so id = 0
  end

  # Returns all messages in specified chatroom,
  # in order of date sent ascending (oldest at beginning)
  def all
    Message.find_by(chatroom: params[:chatroom]).order(:date_sent)
  end
end
