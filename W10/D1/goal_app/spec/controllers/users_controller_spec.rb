require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    subject(:user) { create(:user) }
    
    describe "GET #new" do

        it "displays new user creation form" do 
            get :new 
            expect(response).to render_template(:new)
        end
    end

    describe "GET #index" do

        it "displays all users" do 
            get :index 
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        before { user.save! }
        it "displays a single user" do 
            get :show, params: { id: user.id }
            expect(response).to render_template(:show)
        end

        it "redirects to index when user is not found" do 
            get :show, params: { id: -1 }
            expect(response).to render_template(:index)
            expect(flash[:errors]).to be_present
            
        end
    end


    describe "POST #create" do
      it "fails with invalid params" do
        post :create, params: { user: { username: "Jack", password: "" } }
          expect(response).to render_template(:new)
          expect(flash[:errors]).to be_present
      end

      it "logs the new user in" do 
        post :create, params: { user: { username: "Jack", password: "123456" } }
            user = User.find_by_credentials("Jack", "123456")
            expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects the new user to the users index" do 
            post :create, params: { user: { username: "Jack", password: "123456" } }
            expect(response).to redirect_to(users_url)
      end


    end

    



end
