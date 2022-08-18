class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      ##配送先郵便番号を保存するカラム
      t.string :postal_code, null: false
      
      ##配送先住所を保存するカラム
      t.string :address, null: false
      
      ##配送先宛名を保存するカラム
      t.string :name, null: false
      
      ##送料を保存するカラム
      t.integer :shipping_cost, null: false
      
      ##支払方法を保存するカラム
      t.integer :payment_method, null: false, default: 0
      
      ##合計金額を保存するカラム
      t.integer :total_payment, null: false
      
      ##注文ステータスを保存するカラム
      t.integer :status, null: false, default: 0
      
      t.timestamps
    end
  end
end
