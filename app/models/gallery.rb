class Gallery < ActiveRecord::Base
  has_many   :paintings, :dependent => :destroy
  belongs_to :user
end
