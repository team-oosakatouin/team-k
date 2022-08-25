class Item < ApplicationRecord

  has_one_attached :image_id
  belongs_to :genre
  has_many :order_details,dependent: :destroy
  has_many :cart_items,dependent: :destroy

  validates :image_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true


end
