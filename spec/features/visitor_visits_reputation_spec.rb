require "rails_helper"

feature "visitor visits homepage" do
  scenario "they see users by reputation" do
    VCR.use_cassette("features/reputation") do
      visit root_path

      expect(all("#users-by-reputation li").count).to eq(10)

      within("#users-by-reputation") do
        expect(page).to have_content("Tater")
      end
    end
  end

  scenario "they see a list of banned users" do
    VCR.use_cassette("features/banned") do
      visit root_path

      expect(all("#banned-users li").count).to eq(1)

      within("#banned-users") do
        expect(page).to have_content("ryan_2")
      end
    end
  end
end
