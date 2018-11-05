class UsersController < Clearance::UsersController
  # Check this link to see what Clearance::UsersController is doing
  # https://github.com/thoughtbot/clearance/blob/master/app/controllers/clearance/users_controller.rb
  #
  # Probably shouldn't override those methods, but instead make new ones to do what we want to do
  # The methods from that link handle all the user stuff... login, authentication, restricting pages, etc.

  def get_nickname
    #return @user_model.get_nickname
  end

  def set_nickname
    #return @user_model.set_nickname
  end

  def set_starred_chatrooms num_chatrooms
    #return @user_model.set_chatrooms
  end

  def set_user_permissions permissions
    #@user_model.set_permissions permissions
  end

  def send_message message
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
