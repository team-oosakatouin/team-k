class Item < ApplicationRecord
  
  has_one_attached :item_image  
  belongs_to :genre
  has_many :orders_details,dependent: :destroy
  has_many :cart_items,dependent: :destroy
end
