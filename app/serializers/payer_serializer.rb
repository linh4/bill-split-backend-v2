class PayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :items
  has_many :items

  def items
    object.items
  end
end
