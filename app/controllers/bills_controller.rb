class BillsController < ApplicationController
  skip_before_action :authorized
  def index
   @bills = Bill.all
   render json: @bills
 end

 def show
   @bill =  Bill.find(params[:id])
   render json: @bill
 end

 def create
   @bill = Bill.new(bill_params)
  if @bill.save
    @token = encode_token(bill_id: @bill.id)
    render json: @bill, status: :accepted
  else
    render json: {errors: @bill.errors.full_messages}, status: :unprocessible_entity
  end
 end

 private

 def bill_params
   params.require(:bill).permit(:user_id, :date)
 end
end
