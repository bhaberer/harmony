class List < ActiveRecord::Base
  belongs_to :account
  has_many :items

  attr_protect :account_id 

end
