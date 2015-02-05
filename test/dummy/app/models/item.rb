class Item < ActiveRecord::Base

  validates :name, :description, presence: true

end
