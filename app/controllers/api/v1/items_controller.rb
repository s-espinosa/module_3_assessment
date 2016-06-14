class Api::V1::ItemsController < Api::ApiController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).delete

  end
end
