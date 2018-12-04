class User < ApplicationRecord
  include Clearance::User
  # has_many :messages
  has_and_belongs_to_many :chatrooms # starred chatrooms
  has_many :notifications

  def confirm_email
    self.email_confirmed_at = Time.current
    save
  end

  def set_nickname(nickname)
    self.nickname = nickname
  end

  def get_nickname
    return self.nickname
  end

  def get_starred_chatrooms
    return self.chatrooms
  end

  def set_starred_chatrooms chatroom
    # self.chatrooms << chatroom
    # room = Chatroom.find_by(id: chatroom)
    # room.users << self.id
    # self.save
    # room.save
  end

  def remove_starred_chatroom chatroom
    # self.chatrooms.delete chatroom
    # room = Chatroom.find_by(id: chatroom)
    # room.users.delete self.id
    # self.save
    # room.save
  end
end
