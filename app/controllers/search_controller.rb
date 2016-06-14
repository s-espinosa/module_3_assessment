class SearchController < ApplicationController
  def index
    @stores = Store.all_by_zip(params[:zip])
  end

  def show
    @store = Store.by_id(params[:id])
  end
end
