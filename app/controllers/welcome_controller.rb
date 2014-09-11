class WelcomeController < ApplicationController

  def show
    if
  @user = current_user
  @agence = Agence.find(@user.agence_id)
         else
      redirect_to signin_path
    end
    end
end