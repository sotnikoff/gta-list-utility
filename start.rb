require_relative 'mamken_schutken/file_parser.rb'
require_relative 'mamken_schutken/sender.rb'
require_relative 'player_logs/parser.rb'
require_relative 'player_logs/sender.rb'
require_relative 'params/reader.rb'
require_relative 'overseer/parser.rb'
require_relative 'overseer/time_key.rb'

params = Params::Reader.init
key = Overseer::TimeKey.generate

PlayerLogs::Parser.parse(params['token'], params['address'])
MamkenSchutken::FileParser.parse(params['token'], params['address'])

while true do
  Overseer::Parser.parse(params['token'], params['address'], key)
  sleep(params['interval'])
end
