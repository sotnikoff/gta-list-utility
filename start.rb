require_relative 'mamken_schutken/file_parser.rb'
require_relative 'mamken_schutken/sender.rb'
require_relative 'player_logs/parser.rb'
require_relative 'player_logs/sender.rb'

token = 'eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7ImlkIjoxLCJuaWNrbmFtZSI6ImhvZmNoIn0sImV4cCI6MTU4NTE0NzcwOX0.PL-xnGseZSDUN3nIxsLMOyDuvLQUKo-iFQODLw1E8to'
address = 'localhost:3000'

PlayerLogs::Parser.parse(token, address)
MamkenSchutken::FileParser.parse(token, address)
