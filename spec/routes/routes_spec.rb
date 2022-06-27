# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for blog page', type: :routing do
  context HomeController do
    it { should route(:get, root_path).to(action: :index) }
  end

  context SessionsController do
    it { should route(:get, sign_in_path).to(action: :new) }
    it { should route(:post, sign_in_path).to(action: :create) }
    it { should route(:delete, logout_path).to(action: :destroy) }
  end

  context RegistrationsController do
    it { should route(:get, sign_up_path).to(action: :new) }
    it { should route(:post, sign_up_path).to(action: :create) }
  end

  context PasswordsController do
    it { should route(:get, edit_password_path).to(action: :edit) }
    it { should route(:patch, passwords_path).to(action: :update) }
  end

  context PostsController do
    it { should route(:get, posts_path).to(action: :new) }
    it { should route(:post, posts_path).to(action: :create) }
    it { should route(:get, posts_show_path).to(action: :show) }
    it { should route(:delete, posts_delete_path).to(action: :destroy) }
  end

  context UpdatePostsController do
    it { should route(:get, edit_post_path).to(action: :edit) }
    it { should route(:patch, edit_post_path).to(action: :update) }
  end
end
