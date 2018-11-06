class PayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :amount
end
