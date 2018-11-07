class ItemSerializer < ActiveModel::Serializer
  attributes :id, :bill_id, :title, :price, :bill, :payers
  def payers
    object.payers
  end
end
