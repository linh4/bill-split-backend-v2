class PayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :bill_id
  has_many :items

  def items
    object.items
  end

  def bill_id
    object.items.map { |item| item.bill_id }
  end

end
