class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      ##郵便番号を保存するカラム
      t.string :postal_code, null: false
      
      ##住所を保存するカラム
      t.string :address, null: false
      
      ##宛名を保存するカラム
      t.string :name, null: false
      
      t.timestamps
    end
  end
end
