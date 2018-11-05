class BillSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :date, :items, :user, :payers

  def payers
    object.items.map { |item| item.payers  }
  end
end
