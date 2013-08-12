class UserMailer < ActionMailer::Base
  default :from => "Linkage <linkage.notifier@gmail.com>"

  def verification_email(user, link)
    @user = user
    @link = link

    mail :to => @user.email, :subject => 'Verfiy your account'
  end
end
