require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before do
    @user = User.create!(user_attributes)
    end

  context "Quand pas sign in" do

    before do
      session[:user_id] = nil
    end


    it "ne peut pas acceder à index" do
      get :index

      expect(response).to redirect_to(new_session_url)
    end

    it "ne peut pas acceder à show" do
      get :show, id: @user

      expect(response).to redirect_to(new_session_url)
    end

    it "ne peut pas acceder à edit" do
      get :edit, id: @user

      expect(response).to redirect_to(new_session_url)
    end


    it "ne peut pas acceder à update" do
      patch :update, id: @user

      expect(response).to redirect_to(new_session_url)
    end

    it "ne peut pas acceder à destroy" do
      delete :destroy, id: @user

      expect(response).to redirect_to(new_session_url)
    end

  end


  context "Un utilisateur signé" do

    before do
      @wrong_user = User.create!(user_attributes(email:"zobi@gmail.com"))
      session[:user_id] = @wrong_user.id
    end

    it "ne peut pas éditer un autre utilisateur" do
      get :edit, id: @user

      expect(response).to redirect_to(root_url)
    end


    it "ne peut pas updater un autre utilisateur" do
      patch :update, id: @user

      expect(response).to redirect_to(root_url)
    end


  end

  context "Quand signé en tant qu'admin" do

    before do
      admin = User.create!(user_attributes(email:'admin@exemple.com',admin: true))
      session[:user_id] = admin.id
    end

    it "peut accéder à index des users" do
      get :index
      expect(response).to render_template(:index)
    end
    end


  end