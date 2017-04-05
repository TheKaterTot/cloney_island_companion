require "rails_helper"

feature "visitor visits homepage" do
  scenario "they see users by reputation" do
    VCR.use_cassette("features/repuation") do
      visit root_path

      expect(all("#users-by-reputation li").count).to eq(10)

      within("#users-by-reputation") do
        expect(page).to have_content("Lessie")
      end
    end
  end
end
