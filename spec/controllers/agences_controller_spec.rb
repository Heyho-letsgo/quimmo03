require 'rails_helper'

RSpec.describe AgencesController, :type => :controller do


  before do
    @agence = Agence.create!(agence_attributes)
  end

  context "Quand pas signé en tant qu'admin" do

    before do
      non_admin = User.create!(user_attributes(admin: false))
      session[:user_id] = non_admin.id
    end

    it "ne peut accéder à new" do
      get :new

      expect(response).to redirect_to(root_url)
    end


    it "ne peut pas accéder à show" do
      get :show , id:@agence

      expect(response).to redirect_to(root_url)
    end


  end


  context "Quand signé en tant qu'admin" do

    before do
      admin = User.create!(user_attributes(admin: true))
      session[:user_id] = admin.id
    end

    it "peut accéder à index" do
      get :index

      expect(response).to render_template(:index)
    end



  end


  end
