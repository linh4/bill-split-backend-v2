class ItemPayersController < ApplicationController
  def create
    @itemPayer = ItemPayer.new(itemPayer_params)
   if @itemPayer.save
      render json: @itemPayer, status: :accepted
    else
      render json: {errors: @itemPayer.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def
    params.permit(:item_id, :payer_id)
  end
end
