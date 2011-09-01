module WebPicker
  class Spyder  < EventMachine::Connection

    def self.process(url)
      http = EventMachine::HttpRequest.new(url).get
      http.callback do
        HTTPProcessor.extract_links(http.response)
      end
    end

  end
end