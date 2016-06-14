require 'rails_helper'

RSpec.describe "When a visitor searches for stores" do
  it "they see a list of stores" do
    skip
    # As a user
    # After I have searched a zip code for stores
    # When I click the name of a store
    # Then my current path should be "/stores/:store_id"
    # I should see the store name, store type and address with city, state and zip
    # I should see an unordered list of the store hours in the following format:
    #   * Mon: 10am-9pm
    #   * Tue: 10am-9pm
    #   * Wed: 10am-9pm
    #   * Thurs: 10am-9pm
    #   * Fri: 10am-9pm
    #   * Sat: 10am-9pm
    #   * Sun: 11am-7pm


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
