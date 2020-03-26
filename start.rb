require_relative 'mamken_schutken/file_parser.rb'
require_relative 'mamken_schutken/sender.rb'
require_relative 'player_logs/parser.rb'
require_relative 'player_logs/sender.rb'

token = 'eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7ImlkIjoxLCJuaWNrbmFtZSI6ImhvZmNoIn0sImV4cCI6MTYxNTg0ODk1MX0.xP3O_mXUaROQaEARsLGEVoWbAS5CEpkZQnh4-PG_CiI'
address = 'localhost:3000'

PlayerLogs::Parser.parse(token, address)
MamkenSchutken::FileParser.parse(token, address)
