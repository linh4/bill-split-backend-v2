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
    @item = Item.new(item_params)
   if @item.save
      render json: @item, status: :accepted
    else
      render json: {errors: @item.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
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
    params.permit(:bill_id, :title, :price)
  end
end
