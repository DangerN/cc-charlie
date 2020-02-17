class Charlie
  def self.delta_connection
    socket = HTTP::WebSocket.new("0.0.0.0", "/", port: 9002)

    socket.on_message do |message|
      handle_update message
    end

    spawn do
      socket.run
    end
  end
end
