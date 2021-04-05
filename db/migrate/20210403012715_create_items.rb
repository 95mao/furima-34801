class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :goods_name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :burden_id, null: false
      t.integer :start_id, null: false
      t.integer :preparation_id, null: false
      t.integer :price, null: false
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
