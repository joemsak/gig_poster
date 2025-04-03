require "net/http"

class GeocodingController < ApplicationController
  def create
    uri = URI("http://api.geonames.org/findNearbyPostalCodesJSON")
    uri.query = { lat:, lng:, username: :joemsak }.to_query
    res = Net::HTTP.get(uri)
    postal_code = JSON(res)["postalCodes"][0]["postalCode"]

    current_user.update!(lat:, lng:, postal_code:)

    render json: { lat:, lng:, postal_code: }
  end

  private

  def lat
    params.expect(:lat)
  end

  def lng
    params.expect(:lng)
  end
end
