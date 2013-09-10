class UserMailer < ActionMailer::Base
  default :from => "Linkadex <linkadex.notifier@gmail.com>"

  def verification_email(user, link)
    @user = user
    @link = link

    mail :to => @user.email, :subject => 'Verfiy your account'
  end

  def forgotten_password(user, new_password, link)
    @user = user
    @new_password = new_password
    @link = link

    mail :to => @user.email, :subject => 'Password reset'
  end
end
