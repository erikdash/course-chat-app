require 'date'
class MessageController < ApplicationController
  def new
    @message = Message.new(message_params)
    @message.date_sent = DateTime.now
    # TODO need to set id?
  end

  private
    def message_params
      params.require(:contents, :user)
    end
end
