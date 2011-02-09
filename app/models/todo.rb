class Todo < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many :users
  
  validates_presence_of :task

  
  def done? 
    self.users == [] 
  end 

  def check_off(user)
    if self.users.include? user 
      self.users.delete user
    else 
      false
    end
  end 

  def set_type(type, user, friend)
    case type 
    when 'me'
      self.users = [user]
    when 'you'
      self.users = [friend]
    when 'we'
      self.users = [user, friend]
    when 'either'
      self.users = [user, friend]
    end 
    self.save 
  end

end
