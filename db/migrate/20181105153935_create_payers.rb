class CreatePayers < ActiveRecord::Migration[5.2]
  def change
    create_table :payers do |t|
      t.string :name
      t.float :amount
      t.timestamps
    end
  end
end
