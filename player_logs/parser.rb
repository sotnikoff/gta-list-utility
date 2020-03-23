module PlayerLogs
  class Parser
    def initialize(token, address, sender)
      @files = Dir.glob('../Player Logs/*')
      @sender = sender
      @token = token
      @address = address
    end

    def parse
      result = @files.map { |f| read_file(f) }
      @sender.send(result, @token, @address)
    end

    def self.parse(token, address)
      new(token, address, Sender).parse
    end

    private

    def read_file(file)
      f = File.open(file).read
      matches = f.match(/Name=([a-zA-Z0-9_-]*)\r\nIP=(\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3})\r\nRockstar ID=(\d*)/)
      { r_star_id: matches[3], name: matches[1], ip: matches[2] }.compact if check_match(matches)
    end

    def check_match(matches)
      !(matches[1].nil? || matches[2].nil? || matches[3].nil?)
    end
  end
end
