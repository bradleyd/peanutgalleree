class Painting < ActiveRecord::Base
  #attr_accessor :remote_image_url
  attr_accessible :gallery_id, :name, :image, :remote_image_url, :description

  belongs_to :gallery
  has_many :comments

  mount_uploader :image, ImageUploader

  after_save :send_new_painting_alert

  def send_new_painting_alert
    ArtistMailer.new_painting(self.gallery.user, self).deliver
  end
   
end
