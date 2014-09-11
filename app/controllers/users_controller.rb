class UsersController < ApplicationController

  before_action :require_signin # , except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]



before_action :set_agence, only: [:create]


  def index
  @agence = Agence.find(params[:agence_id])
  @users = @agence.users
  @user = @users.where(:agence_id)
    #.paginate(:page => params[:page], :per_page => 15)
#@user = @agence.(params[:id])
  end

  def show
    # la variable @agence est utilisée pour la session
    @agence = Agence.find(params[:agence_id])

    # la variable @agence_admin est utilisée pour l'administration et l'affichage des users
    @agence_admin = Agence.find(params[:agence_id])
    @parent_users = @agence_admin.users #, agence_user_path
    @user = @parent_users.find(params[:id])
  end



  def new
          @user = User.new{params[:agence_id]}
          @agence = Agence.find(params[:agence_id])
  end

  def create
    @user = @agence.users.new(user_params) # Important à se souvenir !!
    if @user.save
      session[:user_id] = @user.id
      redirect_to agence_path@agence
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
      redirect_to @user, notice: "User successfully updated!"
    else
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).
        permit(:name, :email, :password, :password_confirmation, :username, :admin, :agence_id)
  end


  def require_correct_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url
    end
  end

 def set_agence
   @agence = Agence.find(params[:agence_id])
 end

end
