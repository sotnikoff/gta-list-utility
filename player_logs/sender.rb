require 'json'
require_relative '../utility/http.rb'

module PlayerLogs
  class Sender
    def initialize(result, token, address, http)
      @result = result
      @token = token
      @address = address
      @http = http
    end

    def send
      return nil if @result.length.zero?

      @http.new({ players: @result }, "http://#{@address}/idiots/create_or_update_batch", @token, 201).post
    end

    def self.send(result, token, address)
      new(result, token, address, Utility::HTTP).send
    end
  end
end
