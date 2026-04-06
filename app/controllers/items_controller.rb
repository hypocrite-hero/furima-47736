class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])  
  end

  def edit
    @item = Item.find(params[:id])    
  end

  def update
        
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :item_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end
end
