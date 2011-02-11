class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  has_one :event, :dependent => :destroy

  validates_presence_of :content

  attr_protected :account_id, :user_id

  def feed_text
    "#{self.user.name} says: \"#{event.note ? event.note.content : 'NO NOTE'}\"."
  end

end
