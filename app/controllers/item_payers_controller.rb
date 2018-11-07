class ItemPayersController < ApplicationController

  skip_before_action :authorized

  def create
    params[:payer_id].each do |id|
      @itemPayer = ItemPayer.create(item_id: params[:item_id], payer_id: id.to_i)
    end
  end

  def destroy
    @itemPayer = ItemPayer.find(params[:id])
    @itemPayer.destroy
    render status: :accepted
  end

  private

  def item_payer_params
    params.require(:item_payer).permit(:item_id, payer: [:payer_id])
  end

end
