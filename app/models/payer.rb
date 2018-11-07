class Payer < ApplicationRecord
  has_many :item_payers
  has_many :items, through: :item_payers

  accepts_nested_attributes_for :items, allow_destroy: true
end
