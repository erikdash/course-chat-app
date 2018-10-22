# class EmailConfirmationGuard < Clearance::SignInGuard
#   def call
#     if unconfirmed?
#       failure("You must confirm your email address.")
#     else
#       next_guard
#     end
#   end

#   def unconfirmed?
#     signed_in? && !current_user.confirmation_token
#   end
# end

Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "confirmation@chatapp.com"
  config.rotate_csrf_on_sign_in = true
  # config.sign_in_guards = [EmailConfirmationGuard]
end
