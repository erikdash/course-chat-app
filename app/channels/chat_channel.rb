class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "chat_channel"
    stream_from "room-#{params['room']}:messages"
  end

  def unsubscribed
  end

  def send_message(data)
    chatroom = Chatroom.find_by(chat_room_name: data['current_room'])
    message = Message.create(contents: data['message'], user: current_user, chatroom: chatroom, date_sent: DateTime.now)
    chatroom.messages << message
    unless message.save!
      flash.now[:error] = "Could not create message"
    end
  end
end
