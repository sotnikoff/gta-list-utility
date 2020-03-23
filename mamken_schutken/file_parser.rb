require 'json'

module MamkenSchutken
  class FileParser
    def initialize(file_path, token, address)
      @file_path = file_path
      @token = token
      @address = address
    end

    def operate_file
      lines = []
      @text = File.open(@file_path).read
      formatted_text = @text.gsub(/\r\n?/, "\n")
      formatted_text.each_line do |line|
        lines << operate_line(line)
      end
      backup_file
      result = MamkenSchutken::Sender.new(lines.compact, @token, @address).send
      empty_file if result
      nil
    end

    private

    def empty_file
      File.open(@file_path, 'w') do |w|
        w.write('')
      end
    end

    def backup_file
      File.open("../Chat Dumps/auto backup #{Time.now.to_s}.txt", 'w') do |w|
        w.write(@text)
      end
    end

    def operate_line(line)
      line_result = {}
      line.scan(/~c~\[\d\d:\d\d:\d\d\]: ~.~(\S+):\s(.+)/) do |match|
        line_result = { author: match[0], message: match[1] }
      end
      line_result if line_result != {}
    end

    def self.parse(token, address)
      FileParser.new('../Chat Dumps/Constant Chat Log.txt', token, address).operate_file
    end
  end
end
