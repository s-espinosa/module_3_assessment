class SearchController < ApplicationController
  def index
    @stores = BestBuyService.new.all_by_zip(params[:zip])
  end
end
