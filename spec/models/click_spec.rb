require 'rails_helper'

RSpec.describe Click, type: :model do
  it "belongs to url" do
    url = create(:url)
    click = url.click_records.create(ip: "1.2.3.4", user_agent: "TestAgent")
    expect(click.url).to eq(url)
    # expect(url.click_records).to include(click)
    expect(url.click_records.count).to eq(1)
  end
end
