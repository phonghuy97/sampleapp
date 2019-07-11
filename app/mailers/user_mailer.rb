class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailers.user_mailer.act_account")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("mailers.user_mailer.reset_pass")
  end
end
