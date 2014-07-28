require 'rails_helper'

RSpec.describe GalleriesController, :type => :controller do
    
  login_user

  before :each do
   @gallery = FactoryGirl.create(:gallery)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(assigns(:galleries)).to eq([@gallery])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: @gallery
      expect(response).to be_success
      expect(assigns(:gallery)).to eq(@gallery)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      gallery = FactoryGirl.create(:gallery)
      expect{
        delete :destroy, id: gallery 
      }.to change(Gallery,:count).by(-1)
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update, id: @gallery
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: @gallery
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "creates a new contact" do 
      expect{
        post :create, gallery: FactoryGirl.attributes_for(:gallery) 
      }.to change(Gallery,:count).by(1)
    end
  end
end
