class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  #クレジットカード:0, 銀行振り込み
  enum payment_method: { credit_card: 0, transfer: 1 }
  #入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4
  enum status: { wait_payment: 0, payment_confirmation: 1, now_production: 2, wait_send: 3, shipping: 4 }
  
  def add_tax_on_price
    (self.price * 1.10).round
  end
  

end
