class Item < ApplicationRecord
  belongs_to :bill
  has_many :item_payers
  has_many :payers, through: :item_payers
end
