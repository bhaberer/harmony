class Account < ActiveRecord::Base

  has_and_belongs_to_many :users 
  has_many :invites
  has_many :notes 
end
