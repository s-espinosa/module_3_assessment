class BestBuyService
  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com") do |f|
      f.request  :url_encoded
      f.adapter  Faraday.default_adapter
    end
  end

  def all_by_zip(zip)
    stores = @connection.get do |req|
      req.url "/v1/stores(area(#{zip},15))"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["best_buy_key"]
      req.params['show'] = "storeId,storeType,longName,city,phone,distance"
    end
    JSON.parse(stores.body)["stores"]
  end

  def by_id(id)
    store = @connection.get do |req|
      req.url "/v1/stores(storeId=#{id})"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["best_buy_key"]
      req.params['show'] = "storeId,storeType,longName,city,phone,distance,hoursAmPm,region,postalCode"
    end
    JSON.parse(store.body)["stores"]
  end
end
