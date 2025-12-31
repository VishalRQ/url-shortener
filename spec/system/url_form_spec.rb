require 'rails_helper'

RSpec.describe Url, type: :system do
  it "allows user to create a new shortened URL" do
    visit new_url_path

    fill_in "Original url", with: "https://example.com"
    click_button "Shorten URL"

    expect(page).to have_content("https://example.com")
    expect(page).to have_content("Shortened URL")
  end

  context "To check Form contents" do
    it "displays the URL shortening form" do
      visit new_url_path

      expect(page).to have_field("Original url")
      expect(page).to have_button("Shorten URL")
    end
  end
end
