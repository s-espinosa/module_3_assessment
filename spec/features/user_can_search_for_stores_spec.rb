require 'rails_helper'

RSpec.describe "When a visitor searches for stores" do
  it "they see a list of stores" do
    visit '/'
    fill_in "zip", with: "80202"
    click_on "Find Stores"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Littleton")
  end
end
