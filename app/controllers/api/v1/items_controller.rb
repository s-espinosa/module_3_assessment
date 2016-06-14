class Api::V1::ItemsController < Api::ApiController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    respond_with item
  end

  def create
    item = Item.new(item_params)
    if item.save
      respond_with item
    end
  end

  private
  def item_params
    params.permit(:name, :description, :image_url)
  end
end
