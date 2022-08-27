class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :item_id, null: false
      
      t.integer :order_id, null: false
      
      ##購入時価格を保存するカラム
      t.integer :price, null: false
      
      ##数量を保存するカラム
      t.integer :amount, null: false
      
      ##制作ステータスを保存するカラム
      t.integer :making_status, null: false, default: 0
      
      t.timestamps
    end
  end
end
