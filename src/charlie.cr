require "cc-alpha"
require "kemal"
require "./charlie/*"

class Charlie
  VERSION = "0.1.0"

  @@subscribers = [] of HTTP::WebSocket

  def self.run
    delta_connection
    kemal_config
    Kemal.run
  end
end

Charlie.run
