# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  let(:user) { User.create(email: 'some@example.com', password: 'password', password_confirmation: 'password') }
  before { session[:user_id] = user.id }

  context 'GET #edit' do
    before { get :edit }
    it { should render_template(:edit) }
  end

  context 'PATCH #update' do
    it 'should update database' do
      patch :update, params: { id: user.id, user: { password: 'newpassword', password_confirmation: 'newpassword' } }
      expect(user.reload.password).to eq(user.password)
    end
  end

  context 'PATCH  invalid #update' do
    it 'should not update database' do
      patch :update, params: { id: user.id, user: { password: nil, password_confirmation: nil } }
      expect(user.reload.password).to eq('password')
    end
  end
end
