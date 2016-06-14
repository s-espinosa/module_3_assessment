require 'rails_helper'

RSpec.describe "GET /api/v1/items" do
  it "it returns a list of items" do
    Item.create(name: "Item1", description: "Description1", image_url: "url")

    get "/api/v1/items"

    expect(response.status).to eq(200)
    json_body = JSON.parse(response.body)
    expect(json_body.count).to eq(1)
    p
    expect(json_body["id"]).to eq("1")
    expect(json_body["name"]).to eq("Item1")
    expect(json_body["description"]).to eq("Description1")
    expect(json_body["image_url"]).to eq("url")
    expect(json_body["created_at"]).to eq(nil)
    expect(json_body["updated_at"]).to eq(nil)
  end
end
