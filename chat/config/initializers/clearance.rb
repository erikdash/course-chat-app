class ConfirmedUserGuard < Clearance::SignInGuard
  def call
    if user_confirmed?
      next_guard
    else
      failure I18n.t("flashes.confirm_your_email")
    end
  end
end

def user_confirmed?
  signed_in? && current_user.email_confirmed_at.present?
end

Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "confirmation@chatapp.com"
  config.rotate_csrf_on_sign_in = true
  config.sign_in_guards = [ConfirmedUserGuard]
end
