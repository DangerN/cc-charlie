class Charlie
  def self.handle_message(message : String, socket : HTTP::WebSocket)
    if (message == "base")
      {"boardList": board_list,
       "announce":  "This site is still under development.",
       "type":      "boardList",
      }
    else
      return {"error" => "Bad Request"} unless board_list.keys.includes?(message)
      {"type"      => "boardDump",
       "boardDump" => {
         "#{message}" => board_by_id(message),
       }}
    end
  end
end
