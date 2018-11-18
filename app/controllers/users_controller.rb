class UsersController < Clearance::UsersController
  # Check this link to see what Clearance::UsersController is doing
  # https://github.com/thoughtbot/clearance/blob/master/app/controllers/clearance/users_controller.rb
  #
  # Probably shouldn't override those methods, but instead make new ones to do what we want to do
  # The methods from that link handle all the user stuff... login, authentication, restricting pages, etc.

  def new
    @user = user_from_params
    puts "USER #{@user}"
    session[:user] = @user
    render template: "users/new"
    # @user.nickname = params.require(:nickname)
    # @user.permissions = params.require(:permissions)
  end

  def create
    @user = user_from_params
    @user.email_confirmation_token = Clearance::Token.new
    if @user.save
      ClearanceMailer.registration_confirmation(@user).deliver_later
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
    session[:user] = @user
  end

  def get_nickname
    return @user.get_nickname
  end

  # Sets the user's nickname to be whatever they pass in
  # Throws an error if it could not save
  def set_nickname
    @user.set_nickname(params.require(:nickname))
    unless @user.save
      flash.now[:error] = "Could not update nickname"
    end
  end

  def get_starred_chatrooms
    return @user.get_starred_chatrooms
  end

  # Sets the user's chatrooms to be whatever they pass in
  # Throws an error if it could not save
  def set_starred_chatrooms
    @user.set_starred_chatrooms(params.require(:chatrooms))
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
    message_controller = MessagesController.new
    message_controller.request = request
    message_controller.response = response
    message_controller.create
    redirect_to chat_room_path_url # TODO make this asynchronous
  end

  def send_direct_message

  end

  def user_from_params
    email = user_params.delete(:email)
    nickname = user_params.delete(:nickname)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.nickname = nickname
      user.password = password
      user.permissions = false
    end
  end
end
