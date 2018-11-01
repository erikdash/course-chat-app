class SessionsController < Clearance::SessionsController
  def url_after_create
    all_chatrooms_url
  end

  def sign_up_path
  end

  def new_password_path
  end


end
