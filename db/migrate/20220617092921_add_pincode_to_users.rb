class AddPincodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pincode, :integer
  end
end
