require "rack/skippable/version"

# @example
#
#   skip_when = ->(env) {
#     request = Rack::Request.new(env)
#     return request.path == '/img'
#   }
#   use Rack::Skippable.wrap(Rack::Auth::Basic, skip_when) do |u, p|
#     expected = [ENV['NAME'], ENV['PASSWORD']]
#     expected == [u, p]
#   end
module Rack
  module Skippable
    def self.wrap(base_class, skip_when)
      rack_class = Class.new(base_class)
      rack_class.class_exec(skip_when) do |skip_when|
        define_method(:call) do |env|
          if skip_when.call(env)
            @app.call(env)
          else
            super(env)
          end
        end
      end
      rack_class
    end
  end
end
