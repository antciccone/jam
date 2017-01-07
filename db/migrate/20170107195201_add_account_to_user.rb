class AddAccountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account, :string
    add_column :users, :followers, :integer
  end
end
