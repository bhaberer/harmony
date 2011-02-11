class Item < ActiveRecord::Base
  belongs_to :list

  attr_protect :list_id

end
