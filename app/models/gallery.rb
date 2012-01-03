class Gallery < ActiveRecord::Base
  has_many   :paintings, :dependent => :destroy
  belongs_to :user

  validates_presence_of :name
end
