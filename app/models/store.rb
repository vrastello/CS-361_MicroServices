class Store < ApplicationRecord
  belongs_to :api_responder

  def open?
    if open_now == "No Results"
      "No hours posted"
    else
      open_now ? "Open now" : "Closed"
    end
  end
end
