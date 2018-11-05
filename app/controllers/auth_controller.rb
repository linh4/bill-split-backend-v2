class AuthController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def show
    token = request.headers["Authorization"]
    user = User.find_by(id: decoded_token[0]["user_id"])
    if user
      render json: {name: user.name, username: user.username, id: user.id, jwt:token}
    else
      render json: {error: 'Invalid Token'}, status: 401
    end
  end

  private

  def user_login_params
    params.require(:auth).permit(:username, :password)
  end


end
