class Charlie
  def self.handle_message(message : String, socket : HTTP::WebSocket)
    if (message == "base")
      {"boardList": board_list,
        "announce": "This site is still under development."
      }
    else
      return {"error" => "Bad Request"} unless CC.board_list.keys.includes?(message)
      {"boardDump" => {
        "#{message}" => board_by_id(message)
        }}
    end
  end
end
