class BestBuyService
  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com") do
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def all_by_zip(zip)
    @connection.get do |req|
      req.url "/v1/stores(postalCode=#{zip})"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["best_buy_key"]
      req.params['show'] = "longName,city,distance,phone,storeType"
    end
  end


  format=json
  show=storeId,storeType,name,city,region
  apiKey=YourAPIKey

end
