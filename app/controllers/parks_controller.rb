class ParksController < ApplicationController
  def index
    response = self.connection.get("parks?stateCode=#{params['state']}&api_key=#{ENV['PARKS_API_KEY']}")
    @parsed = JSON.parse(response.body)
  end

  def connection
    Faraday.new(
      url: 'https://developer.nps.gov/api/v1/'
    )
  end
end
