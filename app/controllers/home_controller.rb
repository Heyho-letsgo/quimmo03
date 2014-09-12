class HomeController < ApplicationController

 # before_action 'set_agence'
  #before_action 'require_correct_user'


  def show

    if
    @user = current_user
    @agence = @user.agence
    else
    end
  end
  end

