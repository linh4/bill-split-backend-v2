class Payer < ApplicationRecord
  has_many :item_payers
  has_many :items, through: :item_payers
end
