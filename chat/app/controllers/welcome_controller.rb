class WelcomeController < Clearance::SessionsController
  def signup
    @user = User.new
  end
end
