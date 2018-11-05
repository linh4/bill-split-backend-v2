class UsersController < ApplicationController
end
class UsersController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def bills
    render json: {user: UserSerializer.new(current_user), bills: user.bills}, status: :accepted
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # def me
  #   render json: { user: UserSerializer.new(current_user) }, status: :accepted
  # end

  def create
    @user = User.new(user_params)
    byebug
   if @user.save
     @token = encode_token(user_id: @user.id)
     render json: {user: UserSerializer.new(@user), jwt:@token}, status: :created
   else
     render json: {error: 'Failed to create user'}, status: :not_acceptable
   end
  end

  private

  def user_params
    params.permit(:name, :username, :password)
  end


end
