class User < ActiveRecord::Base
  has_many :galleries, :dependent => :destroy
  has_many :paintings, :through => :galleries

  has_many :fans, :dependent => :destroy
  has_many :followers, :through => :fan

  has_many :inverse_fans, :class_name => "Fan", :foreign_key => "follower_id"
  has_many :inverse_followers, :through => :inverse_fans, :source => :user

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def has_fans?
    self.inverse_fans.present? ? true : false
  end

  def fans_of
    self.fans
  end

  def already_following? user_id
    self.fans.map(&:follower_id).include?(user_id)
  end
end
