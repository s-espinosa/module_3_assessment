class Store < OpenStruct
  def self.service
    BestBuyService.new
  end

  def self.all_by_zip(zip)
    temp_stores = service.all_by_zip(zip)
    temp_stores.map do |store_hash|
      Store.new(store_hash)
    end
  end

  def self.by_id(id)
    temp_store = service.by_id(id)
    Store.new(temp_store.first)
  end
end
