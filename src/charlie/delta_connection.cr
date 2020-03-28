class Charlie
  def self.delta_connection
    p "Atteming to connect to delta"
    socket = HTTP::WebSocket.new("0.0.0.0", "/", port: 9002)
  rescue Errno
    sleep 2
    delta_connection
  else
    socket.on_message do |message|
      Alpha.boards = JSON.parse(message).as_h.transform_values { |board| Alpha::Board.from_json(board.to_json) }
      @@subscribers.each do |subscriber|
        message = {"type" => "fullImage", "image" => Alpha.boards}.to_json
        subscriber.send message
      end
    end

    socket.on_close do
      p "Lost Delta"
      sleep 2
      delta_connection
    end
    spawn do
      socket.run
    end
  end
end
