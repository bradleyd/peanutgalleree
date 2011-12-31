class ArtistMailer < ActionMailer::Base
  default from: "noreply@peanutgalleree.com"

  def new_painting(user)
    @user = user
    @url  = "http://peanutgalleree.com/galleries/1"
    mail(:to => user.email, :subject => "#{user.name} has added a new painting")
  end
end
