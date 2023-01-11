class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    return if @item.user == current_user

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :info, :category_id, :sales_status_id, :shipping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
