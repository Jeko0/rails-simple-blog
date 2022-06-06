require "rails_helper"

RSpec.describe PasswordsController, type: :controller do
  context "before action" do
    it { should use_before_action(:logged_in?) } 
  end
  
  context "GET #edit" do
    before { get :edit }
    it { should respond_with(:found)}
  end
  
  context "PATCH #update" do
    it { expect(response).to have_http_status(:success) }
  end
end
