class Todo < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many :users

  attr_protected :account_id
  
  validates_presence_of :task
  validates_presence_of :todo_type 

  class << self
   def unfinished
     where(:completed => false).order('created_at desc')
   end
   def finished
     where(:completed => true, :hidden => false).order('updated_at desc')
   end
   def for_user(user)
     joins('left outer join todos_users on todos.id=todos_users.todo_id').where('todos_users.user_id = ?', user.id)
   end
  end

  def done? 
    self.users == [] 
  end 

  def check_off(user)
    self.users.delete user if self.users.include? user 
    self.users = [] if self.todo_type == 'either'
    self.toggle!(:completed) if done? && !completed?
  end 

  def hide
    self.hidden = true
    self.save
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
