class AgencesController < ApplicationController

  def index
    @agences = Agence.all

  end


  def show
    @agence = Agence.find(params[:id])
  @users = User.where(params[:agence_id])

  @agence_users = @agence.users

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

  end

  private

  def agence_params
    params.require(:agence).permit(:raison_sociale, :siret, :num_rue, :adresse01l01, :adresse01l02, :adresse01l03, :code_postal, :ville, :region, :pays, :telephone, :fax, :email)
  end

end