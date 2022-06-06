require "rails_helper"

RSpec.describe SessionsController, type: :controller  do
  context "GET #new" do
    before { get :new }
    it { should render_template(:new) }
  end

  context "POST #create" do
    before { post :create, :params => { user: {email: "some@example.com", password: "password"} } }
    it { should respond_with(:success) }
    it { should set_flash } 
  end

  context "invalid #create" do
    before { post :create, :params => { user: {email: nil, password: "password"} } }
    it { should render_template(:new)} 
    it {should set_flash}
  end

  context "DELETE #destroy" do
    before { delete :destroy }
    it { should redirect_to(root_path)}
    it { should set_flash}
  end
end
