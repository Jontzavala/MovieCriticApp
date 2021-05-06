class AddInfoToCritics < ActiveRecord::Migration[6.1]
  def change
    add_column :critics, :uid, :string
    add_column :critics, :provider, :string
  end
end
