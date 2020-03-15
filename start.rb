require_relative 'mamken_schutken/file_parser.rb'
require_relative 'mamken_schutken/sender.rb'

token = 'eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7ImlkIjoxLCJuaWNrbmFtZSI6ImhvZmNoIn0sImV4cCI6MTU4NTE0NzcwOX0.PL-xnGseZSDUN3nIxsLMOyDuvLQUKo-iFQODLw1E8to'
address = 'localhost:3000'

mom_jokes = MamkenSchutken::FileParser.parse
MamkenSchutken::Sender.new(mom_jokes, token, address).send
