class Profile < ActiveRecord::Base
  belongs_to :user

  attr_protect :user_id
 
end
