class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :bill, foreign_key: true
      t.string :title
      t.float :price
      t.timestamps
    end
  end
end
