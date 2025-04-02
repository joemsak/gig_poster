require "net/http"

class GeocodingController < ApplicationController
  def show
    uri = URI("http://api.geonames.org/findNearbyPostalCodesJSON")
    uri.query = { lat:, lng:, username: :joemsak }.to_query

    render json: Net::HTTP.get(uri)
  end

  private

  def lat
    params.expect(:lat)
  end

  def lng
    params.expect(:lng)
  end
end
