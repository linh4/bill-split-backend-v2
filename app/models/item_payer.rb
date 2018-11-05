class ItemPayer < ApplicationRecord
  belongs_to :item
  belongs_to :payer
end
