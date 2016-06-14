require 'rails_helper'

RSpec.describe "When a visitor searches for stores" do
  it "they see a list of stores" do
    visit '/'
    fill_in "zip", with: "80202"
    click_on "Find Stores"
    click_on "Best Buy - Belmar"

    expect(current_path).to eq("/stores/1224")

    expect(page).to have_content("Lakewood")
    expect(page).to have_content("CO")
    expect(page).to have_content("80226")
    expect(page).to have_content("Mon: 10am-9pm")
  end
end
