require 'rails_helper'

RSpec.describe "When a visitor searches for stores" do
  it "they see a list of stores" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in a search box with "80202" and click "search"
    fill_in "zip", with: "80202"
    click_on "Find Stores"

    # Then my current path should be "/search" (ignoring params)
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    # And I should see exactly 15 results
    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("15")
    expect(page).not_to have_content("16")
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
  end
end
