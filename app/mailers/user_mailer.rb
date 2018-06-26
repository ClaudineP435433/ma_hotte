class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: "Bienvenue sur MaHotte.fr, l'app pour garder la magie de Nöel")
    # This will render a view in `app/views/user_mailer`!
  end

end