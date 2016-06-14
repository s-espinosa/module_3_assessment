require 'rails_helper'

RSpec.describe "Delete /api/v1/items/1" do
  it "it deletes the item" do
    Item.create(name: "Item1", description: "Description1", image_url: "url")

    # When I send a DELETE request to /api/v1/items/1
    delete "/api/v1/items/1"

    # I receive a 204 JSON response if the record is successfully deleted
    expect(response.status).to eq(204)
    expect(Item.all).to eq([])
  end
end
