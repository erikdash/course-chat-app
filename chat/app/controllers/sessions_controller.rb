class SessionsController < Clearance::SessionsController
  def url_after_create
    all_chatrooms_url
  end
end
