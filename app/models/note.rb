class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  has_one :event, :dependent => :destroy
end
