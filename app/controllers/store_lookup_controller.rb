class StoreLookupController < ApplicationController
  def new
    @api_responder = APIResponder.new
  end

  def create
    puts search_param.inspect
    @api_response = APIResponder.new(search_param)
    if @api_response.save
      @api_response.save_stores
      flash[:success] = "Here are stores near you!"
      redirect_to store_lookup_path
    else
      flash[:alert] = "Something went wrong."
      redirect_to store_lookup_path
    end
  end

  def search_param
    params.require(:api_responder).permit(:zip_code).merge(user_id: session[:user_id])
  end
end
