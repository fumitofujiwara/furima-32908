class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item


  def create
    favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    if favorite.save!
      redirect_to item_path(@item.id)
    else
      @item = @favorite.item
      @favorites = @item.favorite
      render :'items/show'
    end
  end
  
  def destroy
    @favorite = Favorite.find(:id)

  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
