class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  #着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3
  enum making_status: { ongoing_load: 0, waiting_production: 1, now_production: 2, completion_production: 3 }
  
  def with_tax_price
    (price * 1.1).floor
 end

 def subtotal
    item.price * amount
 end

 def subtotal2
    item.price * amount
 end
  
end
