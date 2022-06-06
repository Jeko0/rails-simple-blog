require "rails_helper"

RSpec.describe Post, :type => :model do
  subject (:user) {User.create(email: "example@new.com", password: "password", password_confirmation: "password")}
  subject { described_class.new(title: "title", content: "content", user_id: user.id) } 

  context "creates new post" do
    it { should be_valid(:subject) } 
  end
  
  context "has user" do
    it { should belong_to(:user) } 
  end

  context "Associations" do 
    it { should belong_to(:user).without_validating_presence }
  end

  context "when attributes is not valid" do
    it { should validate_presence_of(:title) } 
    it { should validate_presence_of(:content) } 
  end
end