class Account < ActiveRecord::Base

  has_and_belongs_to_many :users 
  has_many :invites
  has_many :notes 
  has_many :todos 
  has_many :lists 
  has_many :events 

  def friend(user)
    (self.users - [user]).pop
  end
 
  def harmony?
    self.users.length == 2 
  end

end
