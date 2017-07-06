class UserMailer < ApplicationMailer
  default from: "noteapp@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.like_notification.subject
  #
  def like_notification(user)
    @user = user
    mail(to: @user.email, subject: "Someone liked your note!")
  end
end
