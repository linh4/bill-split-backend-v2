class ItemPayerSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :payer_id
end
