class CreateImageElements < ActiveRecord::Migration[6.1]
  def change
    create_table :image_elements do |t|
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
