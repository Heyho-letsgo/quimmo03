class AgencesController < ApplicationController

    before_action :require_signin #dans tout les cas le user doit être signin
    before_action :require_correct_user, only:  [:show, :edit, :update] # Les users peuvent seulement
    before_action :require_admin, only: [:index, :new] # Les users peuvent seulement



    def index
    @agences = Agence.all

  end


  def show
    @agence = Agence.find(params[:id])
  # @agence = Agence.find(params[:id])
  # @users = current_user.agence_id
  # @agence_users = @agence.users
  # @user = current_user.id
  end

  def new
    @agence = Agence.new
  end


  def create
    @agence = Agence.new(agence_params)
    if @agence.save
      redirect_to @agence, notice: 'Thanks for signing up!'
    else
      render :new
    end
  end


  def edit
    @agence = Agence.find(params[:id])
  end

  def update
    @agence = Agence.find(params[:id])
    if @agence.update(agence_params)
      redirect_to @agence, notice: "Agence successfully updated!"
    else
      render :edit
    end
  end

  private

  def agence_params
    params.require(:agence).permit(:raison_sociale, :siret, :num_rue, :adresse01l01, :adresse01l02, :adresse01l03, :code_postal, :ville, :region, :pays, :telephone, :fax, :email, :image)
  end

    def require_correct_user
      @users = Agence.find(params[:id]).users # On récupère un tableau des utilisateurs de cette agence
      unless @users.index(current_user) # La méthode ruby index
        redirect_to root_url
      end
    end

end