class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      
      ##商品名
      t.string :name, null: false
      
      ##商品説明文
      t.text :introduction, null: false
      
      ##ジャンル
      t.integer :genre_id, null: false
      
      ##税抜き価格
      t.integer :price, null: false
      
      ##販売ステータス
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
