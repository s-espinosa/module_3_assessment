class BestBuyService
  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com") do |f|
      f.request  :url_encoded
      f.response :logger
      f.adapter  Faraday.default_adapter
    end
  end

  def all_by_zip(zip)
    @connection.get do |req|
      req.url "/v1/stores(postalCode=#{zip})"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["best_buy_key"]
      req.params['show'] = "storeId,storeType,name,city,region"
    end
  end
end
