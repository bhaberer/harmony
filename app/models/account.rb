class Account < ActiveRecord::Base

  has_and_belongs_to_many :users 
  has_many :invites, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :todos, :dependent => :destroy 
  has_many :lists, :dependent => :destroy
  has_many :events, :dependent => :destroy

  def friend(user)
    (self.users - [user]).pop
  end
 
  def harmony?
    self.users.length == 2 
  end

end
