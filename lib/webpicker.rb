require 'eventmachine'
require 'em-http'

require 'active_record'

$LOAD_PATH << '../lib'
require 'webpicker/models/config_db'
require 'webpicker/version'

module WebPicker

  autoload :HTTPProcessor, 'webpicker/http_processor'
  autoload :Spyder, 'webpicker/spyder'
  autoload :Link, 'webpicker/models/link'


  SECONDS_FOR_TIMER = 1

  class  Startup

    def initialize
      EventMachine::run {
        EventMachine::add_periodic_timer( SECONDS_FOR_TIMER ) do
          Spyder.process("http://www.trulia.com/property/3061654321-3753-W-Wilson-Ave-Chicago-IL-60625")
        end
      }
    end

  end

end


WebPicker::Startup.new