class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :note
 
  attr_protect :user_id, :note_id, :account_id
end
