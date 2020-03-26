require_relative 'mamken_schutken/file_parser.rb'
require_relative 'mamken_schutken/sender.rb'
require_relative 'player_logs/parser.rb'
require_relative 'player_logs/sender.rb'
require_relative 'params/reader.rb'

params = Params::Reader.init

PlayerLogs::Parser.parse(params['token'], params['address'])
MamkenSchutken::FileParser.parse(params['token'], params['address'])
