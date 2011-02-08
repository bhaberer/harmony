class User < ActiveRecord::Base

  has_one :profile  
  has_and_belongs_to_many :todos
  has_many :notes 
  has_many :events
  has_and_belongs_to_many :accounts

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
 
  def name 
    self.profile = Profile.create! unless self.profile 
    self.profile.name.present? ? self.profile.name : self.email.gsub(/(@.+)$/, '')
  end 
end
