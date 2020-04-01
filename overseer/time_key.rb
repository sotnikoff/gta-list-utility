module Overseer
  class TimeKey
    def self.generate
      new.generate
    end

    def generate
      Time.now.to_i
    end
  end
end
