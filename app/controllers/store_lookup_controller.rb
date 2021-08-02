class StoreLookupController < ApplicationController
  def new; end

  def create
    # results = api call results
    render :new
  end
end
