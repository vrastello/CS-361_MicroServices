class ItemController < ApplicationController
  before_action { ShoppingList.set_active(active_params) }

  def edit
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path, notice: "Item added!"
    else
      redirect_to root_path, alert: "Item not added!"
    end
  end

  def update
    @item = Item.find(update_params[:id].to_i)
    if @item.update(update_params)
      redirect_to root_path, notice: "Item updated"
    else
      render :edit
    end
  end

  def destroy
    Item.destroy(params[:format].to_i)
    flash[:warn] = "Item Deleted"
    redirect_to root_path
  end

  def cart
    @item = Item.find(params[:format].to_i)
    @item.update_attribute(:is_found, true)
    flash[:success] = "One Down!"
    redirect_to root_path
  end
end

private

def create_params
  params.require(:item).permit(:list_id, :name, :quantity, :is_found)
end

def update_params
  params.require(:item).permit(:list_id, :id, :name, :quantity)
end

def active_params
  params[:format].present? ? Item.find(params[:format].to_i)[:list_id] : params[:item][:list_id].to_i
end
