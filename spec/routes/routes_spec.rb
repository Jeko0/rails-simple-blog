require "rails_helper"

RSpec.describe "routes for blog page", type: :routing do
 context "shouldn't let you see the home unless you're logged in" do 
    it "does not allow http route for home" do
      expect(get("http://test.host/home")).not_to be_routable
    end
  end

  context "sign in" do 
    it "routes /sign_in to sessions controller" do 
      expect(get(sign_in_path)).to route_to("sessions#new")
      expect(post(sign_in_path)).to route_to("sessions#create")
      expect(delete(logout_path)).to route_to("sessions#destroy")
    end
  end

  context "sign up" do 
    it "routes /sign_up to registrations controller" do 
      expect(get(sign_up_path)).to route_to("registrations#new")
      expect(post(sign_up_path)).to route_to("registrations#create")
    end
  end

  context "passwords" do 
    it "routes /passwords to passwords controller" do 
      expect(get(edit_password_path)).to route_to("passwords#edit")
      expect(patch(passwords_path)).to route_to("passwords#update")
    end
  end

  context "posts" do 
    it "routes /posts to posts controller" do 
      expect(get(posts_path)).to route_to("posts#new")
      expect(post(posts_path)).to route_to("posts#create")
      expect(get(posts_show_path)).to route_to("posts#show")
      expect(delete(posts_delete_path)).to route_to("posts#destroy")
    end
  end

  context "editing posts" do 
    it "routes /update_posts to update_posts controller" do 
      expect(get(edit_post_path)).to route_to("update_posts#edit")
      expect(patch(edit_post_path)).to route_to("update_posts#update")
    end
  end
end
