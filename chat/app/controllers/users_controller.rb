class UsersController < Clearance::UsersController
  # Check this link to see what Clearance::UsersController is doing
  # https://github.com/thoughtbot/clearance/blob/master/app/controllers/clearance/users_controller.rb
  #
  # Probably shouldn't override those methods, but instead make new ones to do what we want to do
  # The methods from that link handle all the user stuff... login, authentication, restricting pages, etc.

  def new
    @user = user_from_params
    render template: "users/new"
    @user.nickname = params.require(:nickname)
    @user.permissions = params.require(:permissions)
  end

  def get_nickname
    return @user.nickname
  end

  # Sets the user's nickname to be whatever they pass in
  # Throws an error if it could not save
  def set_nickname
    @user.nickname = params.require(:nickname)
    unless @user.save
      flash.now[:error] = "Could not update nickname"
    end
  end

  def get_starred_chatrooms 
    return @user.chatrooms
  end

  # Sets the user's chatrooms to be whatever they pass in
  # Throws an error if it could not save
  def set_starred_chatrooms 
    @user.chatrooms << params.require(:chatrooms)
    unless @user.save
      flash.now[:error] = "Could not set chatrooms"
    end
  end

  def remove_starred_chatroom
    @user.chatrooms.delete(Chatroom.find_by(id: params.require(:id)))
    if user.chatrooms.find(Chatroom.find_by(id: params.require(:id)))
      flash.now[:error] = "Could not unstar chatroom"
    end

    unless @user.save
      flash.now[:error] = "Could not update chatrooms"
    end
  end

  # Sets the user's permissions to be whatever they pass in
  # Throws an error if it could not save
  def set_user_permissions 
    @user.permissions = params.require(:permissions)
    unless @user.save
      flash.now[:error] = "Could not update permissions"
    end
  end

  def send_message 
    #@user_model.send_message(message)
  end

  def send_direct_message direct_message
    #@user_model.send_direct_message(direct_message)
  end

  

  private
    def send_message_params
      params.require(:message)
    end

end
