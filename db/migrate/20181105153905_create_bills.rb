class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.string :date
      t.float :tax, default: 0
      t.integer :tip, default: 0
      t.timestamps
    end
  end
end
