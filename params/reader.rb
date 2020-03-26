module Params
  class Reader
    def initialize
      @file = './config.json'
    end

    def init
      File.open(@file) do |f|
        @params = JSON.parse(f.read).slice('address', 'token')
      end
    end

    def self.init
      new.init
    end
  end
end
