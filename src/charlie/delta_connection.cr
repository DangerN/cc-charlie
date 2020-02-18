class Charlie
  def self.delta_connection
    socket = HTTP::WebSocket.new("0.0.0.0", "/", port: 9002)

    socket.on_message do |message|

      puts JSON.parse(message).as_h.transform_values { |board| Alpha::Board.from_json(board.to_json) }
      
    end

    spawn do
      socket.run
    end
  end
end
