class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 7, scale: 2
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
