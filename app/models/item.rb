class Item < ActiveRecord::Base
  belongs_to :list

  attr_protected :list_id

end
