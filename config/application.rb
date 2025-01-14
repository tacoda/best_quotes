require "reins"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module BestQuotes
    class Application < Reins::Application
    end
end