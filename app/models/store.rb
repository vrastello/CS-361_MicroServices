class Store < ApplicationRecord
  belongs_to :api_responder

  def open?
    open_now ? "Open now" : "Closed"
  end
end
