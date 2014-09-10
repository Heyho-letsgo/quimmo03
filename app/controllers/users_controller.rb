class UsersController < ApplicationController

#before_action :set_agence


  def index
  @agence = Agence.find(params[:agence_id])
  @users = @agence.users
  @user = @users.where(:agence_id)
    #.paginate(:page => params[:page], :per_page => 15)
#@user = @agence.(params[:id])
  end

  def show
        @agence = Agence.find(params[:agence_id])
        @parent_users = @agence.users #, agence_user_path
        @user = @parent_users.find(params[:id])
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




  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).
        permit(:name, :email, :password, :password_confirmation, :username, :admin, :agence_id)
  end


 def set_agence
   @agence = Agence.find(params[:agence_id])
 end

end
