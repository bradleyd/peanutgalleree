class ArtistMailer < ActionMailer::Base
  default from: "noreply@peanutgalleree.com"

  def new_painting(user, painting)
    @user = user
    @painting = painting
    to_list = user.inverse_followers.map(&:email)
    @url  = "http://peanutgalleree.com/painting/#{painting.id}"
    mail(:to => to_list, :subject => "#{user.name} has added a new painting")
  end
end
