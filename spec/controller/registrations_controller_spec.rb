require "rails_helper"

RSpec.describe RegistrationsController, type: :controller do
  context "#create success" do
    it { expect(response).to have_http_status(:success) }
  end

  context "#create not valid" do
    before { post :create ,  :params => {user: { email: nil, password: 'password', password_confirmation: 'password'} } }
    it { should render_template(:new)}
  end
end
