require "rails_helper"

RSpec.describe User, :type => :model do 
  subject{ described_class.new(email: "example@new.com", password: "password", password_confirmation: "password") }

  context "should register new user" do
    it { should be_valid(:subject) } 
  end

  context "should not register new user" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "it has many posts" do
    it { should have_many(:posts) }
  end
end
