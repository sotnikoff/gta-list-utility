require 'json'
require_relative './sender.rb'

module Overseer
  class Parser
    def initialize(token, host_address, time_key)
      @file = '../Overseer/overseerconfig.json'
      @backup_file = "../Overseer/overseerconfig_#{time_key}.json"
      @sender = Sender
      @token = token
      @host_address = host_address
    end

    def self.parse(token, host_address, time_key)
      new(token, host_address, time_key).parse
    end

    def parse
      @file_data = File.open(@file).read || []
      @data = @sender.send(JSON.parse(@file_data), @token, @host_address)
      backup_file
      write_to_file
    end

    def backup_file
      File.open(@backup_file, 'w') do |w|
        w.write(@file_data)
      end
    end

    def write_to_file
      File.open(@file, 'w') do |w|
        w.write(@data[:body])
      end
    end
  end
end
