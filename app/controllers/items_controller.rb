class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find params[:id]

  end

  def new
    @item = Item.new
    @item.images.attach(params[:images])
  end

  def create
    @item = current_user.items.new item_attributes
  end

  def edit
    @item = Item.find(params[:id])
    @item.images.attach(params[:images])

    unless @item.user == current_user
      redirect_to items_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def update
    @item = current_user.items.find params[:id]

    if @item.update item_attributes
      redirect_to item_url(@item)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find params[:id]
    unless @item.user == current_user
      redirect_to items_path, alert: 'You are not authorized to perform this action.'
    end
    @item.destroy
    redirect_to items_url
  end

  private

  def item_attributes
    params.require(:item).permit(:name, :price, :phone, :category_id, images: [])
  end
end