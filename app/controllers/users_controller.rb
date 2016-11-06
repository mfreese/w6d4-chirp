
class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show_user
    @user = current_user
    render json: @user
  end

    def show
      @user = User.find_by(name: params[:name])
      if @user
      render json: @user
    else
      render json: ["Unable to locate user "], status: 404
      end
    end

  def log_in
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      render json: @user
    else
      render json: ["Invalid"], status: :unauthorized
    end
  end

  def follow
    current_user.follow!(User.find(params[:id]))
    render json: @current_user
  end

  def unfollow
    current_user.unfollow!(User.find(params[:id]))
    render json: @current_user
  end

  def all_followers
    @followers = User.find(params[:id]).followers(User)
    render json: @followers
  end

  private

  def user_params
    params.permit(:email, :password, :avatar, :name)
  end
end
