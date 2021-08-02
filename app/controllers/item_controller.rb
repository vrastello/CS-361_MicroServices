class ItemController < ApplicationController

  def edit
  end

  def create
    puts params.inspect
    params
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path, notice: "Successfully added item"
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
    redirect_to root_path, notice: "Item Deleted"
  end
end

private

def create_params
  params[:item][:quantity].to_i
  params.require(:item).permit(:list_id, :name, :quantity, :is_found)
end

def update_params
  params.require(:item).permit(:id, :name, :quantity)
end