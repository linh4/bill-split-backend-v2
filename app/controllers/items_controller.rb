class ItemsController < ApplicationController

  skip_before_action :authorized

  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    # byebug
    params[:item].each do |item|
      @item = Item.create(bill_id:params[:bill_id], title: item["title"], price: item["price"])
    end
    # @items = Item.all.select do |item|
    #   item.bill_id == params[:bill_id]
    # end
    # render json: @items
  end

  def update
    @item = Item.find(params[:id])
    @item.update(title: params["title"], price: params["price"], quantity: params["quantity"].to_i)
    if @item.save
      render json: @item, status: :accepted
    else
      render json: {errors: @item.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render status: :accepted
  end

private

  def item_params
    params.require(:item).permit(:bill_id, item: [:title, :price], :quantity)
  end
end
