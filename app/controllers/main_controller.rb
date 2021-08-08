# frozen_string_literal: true

class MainController < ApplicationController
  def index
    if Current.user.nil?
      redirect_to sign_in_path
    else
      @shopping_list = ShoppingList.new
      @item = Item.new
    end
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    if @shopping_list.save
      redirect_to root_path, notice: "Successfully added new list"
    else
      flash[:alert] = "New list not added" 
      redirect_to root_path
    end
  end

  def edit; end

  def destroy
    ShoppingList.where(user_id: Current.user[:id]).delete_all
    flash[:success] = "See you next time!"
    redirect_to root_path
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:name).merge(user_id: session[:user_id])
  end
end
