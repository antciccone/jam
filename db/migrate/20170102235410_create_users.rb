class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :uid
      t.string :name
      t.string :nickname
      t.string :spotify
      t.string :image
      t.string :token
      t.string :refresh_token
      t.datetime :token_expire
      t.string :url

      t.timestamps
    end
  end
end
