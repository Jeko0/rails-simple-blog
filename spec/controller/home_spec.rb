# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context 'GET #index' do
    before { get :index }
    it { should respond_with(:found) }
  end
end
