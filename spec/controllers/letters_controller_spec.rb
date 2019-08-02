require 'rails_helper'

RSpec.describe LettersController, type: :controller do
    
    describe "letters#index action" do
    
    it "should successfully show the leters page" do
          get :index
          expect(response).to have_http_status(:success)
        end
    end
   
    
    it "should properly deal with validation errors" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
    end

end

