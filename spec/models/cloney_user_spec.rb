require "rails_helper"

describe CloneyUser do
  let(:user) { CloneyUser.new({"name" => "Freddie",
                               "email" => "paws@woof.com",
                               "reputation" => 7})
              }
  describe "#name" do
    it "returns the user's name" do
      expect(user.name).to eq("Freddie")
    end
  end

  describe "#reputation" do
    it "returns the user's reputation" do
      expect(user.reputation).to eq(7)
    end
  end

  describe "#email" do
    it "returns the user's email" do
      expect(user.email).to eq("paws@woof.com")
    end
  end
end
