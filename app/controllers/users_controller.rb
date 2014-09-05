class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Thanks for signing up!'
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).
        permit(:name, :email, :password, :password_confirmation, :username, :admin)
  end


end
