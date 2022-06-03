require "rails_helper"

RSpec.describe Post, :type => :model do
  subject (:user) {User.create(email: "example@new.com", password_digest: "password")}
  subject { described_class.new(title: "title", content: "content", user_id: user.id) } 

  context "creates new post" do
    it "has valid attributes" do 
      expect(subject).to be_valid
    end
  end
  
  context "has user" do
    it { should belong_to(:user) } 
  end

  context "Associations" do 
    it { should belong_to(:user).without_validating_presence }
  end

  context "when attributes is not valid" do
    it "should not create a post on empty title" do 
      subject.title = nil
      expect(subject).to_not  be_valid
    end

    it "should not create a post on empty content" do 
      subject.content = nil 
      expect(subject).to_not be_valid  
    end
  end
end