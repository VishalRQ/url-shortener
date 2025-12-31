require 'rails_helper'

RSpec.describe Url, type: :model do
  it "has a valid factory" do
    expect(build(:url)).to be_valid
  end

  it "generates short_code on create" do
  url = create(:url)
  expect(url.short_code).to be_present
  end

  it "defaults clicks to 0" do
    url = create(:url)
    expect(url.clicks).to eq(0)
  end
  context "URL are unique always" do
    it "ensures short_code uniqueness" do
      url1 = create(:url)
      url2 = create(:url)

      expect(url1.short_code).not_to eq(url2.short_code)
    end
  end

    it "uses short_code as param" do
    url = create(:url, short_code: "xyz789")
    expect(url.to_param).to eq("xyz789")
  end
end
