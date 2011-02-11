class List < ActiveRecord::Base
  belongs_to :account
  has_many :items

  attr_protected :account_id 

end
