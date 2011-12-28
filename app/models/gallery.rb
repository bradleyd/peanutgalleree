class Gallery < ActiveRecord::Base
  has_many   :paintings
  belongs_to :user
end
