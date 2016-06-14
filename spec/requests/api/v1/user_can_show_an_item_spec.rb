require 'rails_helper'

RSpec.describe "GET /api/v1/items" do
  it "it returns a list of items" do
    Item.create(name: "Item1",
                description: "Description1",
                image_url: "url1")
    Item.create(name: "Item2",
                description: "Description2",
                image_url: "url2")




    get "/api/v1/items"

    expect(response.status).to eq(200)
    json_body = JSON.parse(response.body)
    expect(json_body.count).to eq(2)
    expect(json_body.first["id"]).to eq(1)
    expect(json_body.first["name"]).to eq("Item1")
    expect(json_body.first["description"]).to eq("Description1")
    expect(json_body.first["image_url"]).to eq("url1")
    expect(json_body.first["created_at"]).to eq(nil)
    expect(json_body.first["updated_at"]).to eq(nil)
  end
end
