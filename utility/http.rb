require 'httparty'

module Utility
  class HTTP
    def initialize(body, address, token, expected_response = 200)
      @body = body
      @address = address
      @token = token
      @expected_response = expected_response
    end

    def post
      response = HTTParty.post(
        @address,
        body: @body.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{@token}"
        }
      )
      return true if response.code == @expected_response
    end
  end
end
