require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
    describe "records#index action" do
    
        it "should successfully show the reords page" do
              get :index
              expect(response).to have_http_status(:success)
            end
        end
end
