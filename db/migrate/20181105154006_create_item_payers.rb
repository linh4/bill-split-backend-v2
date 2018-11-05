class CreateItemPayers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_payers do |t|
      t.references :item, foreign_key: true
      t.references :payer, foreign_key: true
      t.timestamps
    end
  end
end
