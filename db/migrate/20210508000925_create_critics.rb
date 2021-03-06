class CreateCritics < ActiveRecord::Migration[6.1]
  def change
    create_table :critics do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
