require 'rails_helper'

RSpec.describe "When a visitor visits /" do
  it "they see the root page" do
    visit '/'

    expect(page).to have_content("Storedom")
  end
end
