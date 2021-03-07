require 'rack'
require 'rack/reverse_proxy'

target = ENV["TO"] || "http://localhost:9292"
module AddRequestDump
    def call
        p source_request.env
        p source_request.body.read

        super
    end
end
RackReverseProxy::RoundTrip.prepend AddRequestDump

use Rack::ReverseProxy do
    reverse_proxy '/', target
end

run Proc.new {}
