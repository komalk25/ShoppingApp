class AddVideoToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :video, :string
  end
end
