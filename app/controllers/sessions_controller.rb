class SessionsController < ApplicationController

  def new
  end

  def create
        if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      #flash[:notice] = "Welcome back #{user.name}!" #- Modifcation du fichier suivant sur la méthode name
                                                    # au lieu de username-/home/andrew/.rvm/gems/ruby-2.1.1/gems/rack-1.5.2/lib/rack/auth/basic.rb
      @user_mail = User.where(params[:email])

     # redirect_to user
     redirect_to welcome_path
      #redirect_to(session[:intended_url] || user)
      #"session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end
    def destroy
      session[:user_id] = nil
      redirect_to home_path, notice: "You're now signed out!"
    end
end



private
def session_params
  params.require(:session_params).
      permit(:email)
end