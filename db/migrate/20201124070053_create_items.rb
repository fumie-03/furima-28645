class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.references :user, foreign_key: true
      t.integer :category_id
      t.integer :condition_id
      t.integer :postage_id
      t.integer :prefecture_id
      t.integer :send_time_id
      t.integer :price
      t.timestamps
    end
  end
end
