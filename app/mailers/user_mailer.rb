class UserMailer < ApplicationMailer
    default from: "minhws220500@gmail.com"


    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Sample Email')
      end
end
