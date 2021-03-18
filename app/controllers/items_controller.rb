class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
    @item.save
    root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :selling_price).merge(user_id: current_user.id)
  end

end
