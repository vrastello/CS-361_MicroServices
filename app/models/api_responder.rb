class APIResponder < ApplicationRecord
  belongs_to :user
  has_many :stores
  require "http"
  require "json"

  def nearby_places
    api_end_point = "https://savvy-mantis-321721.wl.r.appspot.com/markets/"
    response = HTTP.get(api_end_point + zip_code.to_s)
    response_hash = {}
    parsed_response = JSON.parse(response)
    vars = %w[name opening_hours rating user_ratings_total vicinity]
    5.times do |index|
      response_hash["Store#{index}"] = {}
      vars.each do |x|
        if x == "opening_hours"
          response_hash["Store#{index}"]["open_now"] = parsed_response[index][x]["open_now"]
        else
          response_hash["Store#{index}"][x] = parsed_response[index][x] 
        end
      end
    end
    response_hash
  end

  def save_stores
    response_hash = nearby_places
    params = response_hash
    5.times do |i|
      merged_param = params["Store#{i}"].merge("api_responder_id" => id)
      Store.create(merged_param)
    end
  end
end
