class SessionsController < Clearance::SessionsController
  def url_after_create
    redirect_to all_chatrooms_url
  end
end
