class Todo < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many :users
  
  validates_presence_of :task
  validates_presence_of :todo_type 

 
  def done? 
    self.users == [] 
  end 

  def check_off(user)
    self.users.delete user if self.users.include? user 
    self.users = [] if self.todo_type == 'either'
  end 

  def add_unfinished_users(user, friend)
    case self.todo_type
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
