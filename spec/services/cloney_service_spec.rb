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
end
