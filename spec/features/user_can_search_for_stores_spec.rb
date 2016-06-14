require 'rails_helper'

RSpec.describe "When a visitor searches for stores" do
  it "they see a list of stores" do
    visit '/'
    fill_in "zip", with: "80202"
    click_on "Find Stores"

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("15")
    expect(page).not_to have_content("16")
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
  end
end
