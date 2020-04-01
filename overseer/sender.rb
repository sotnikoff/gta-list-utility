require 'json'
require_relative '../utility/http.rb'
require 'httparty'

module Overseer
  class Sender
    def initialize(result, token, host_address, http)
      @result = result
      @token = token
      @host_address = host_address
      @http = http
    end

    def send
      return nil if @result.length.zero?

      response = HTTParty.put(
        "http://#{@host_address}/idiots/sync",
        body: { overseer: @result }.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{@token}"
        }
      )
      { body: response.body, code: response.code }
    end

    def self.send(result, token, host_address)
      new(result, token, host_address, Utility::HTTP).send
    end
  end
end
