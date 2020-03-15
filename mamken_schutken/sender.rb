require 'httparty'
require 'json'

module MamkenSchutken
  class Sender
    def initialize(result, token, address)
      @result = result
      @token = token
      @address = address
    end

    def send
      return nil if @result.length.zero?

      response = HTTParty.post(
        "http://#{@address}/mamken_schutkens",
        body: { messages: @result }.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{@token}"
        }
      )
      return true if response.code == 204
    end
  end
end
