class Todo < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many :users
  
  TYPES = [
    [ "I need to",   	 	 "me" ],
    [ "You need to", 		 "you" ],
    [ "Both of us need to",      "hard" ],
    [ "Either of us need to",    "expert" ],
  ]


end
