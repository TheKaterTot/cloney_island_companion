require "rails_helper"

describe CloneyService do
  describe ".users_by_reputation" do
    it "returns the users with the best reputations" do
      VCR.use_cassette("services/reputation") do
        users = CloneyService.users_by_reputation
        expect(users.count).to eq(10)
      end
    end
  end

  describe ".banned_users" do
    it "returns all banned users" do
      VCR.use_cassette("services/banned") do
        users = CloneyService.banned_users
        expect(users.count).to eq(1)
      end
    end
  end
end
