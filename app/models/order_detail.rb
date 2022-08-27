class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  #着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3
  enum making_status: { ongoing_load: 0, waiting_production: 1, now_production: 2, completion_production: 3 }
  
end
