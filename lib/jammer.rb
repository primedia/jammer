require 'jammer/version' unless defined?(Jammer::VERSION)
require 'ostruct'
require 'optparse'

module Jammer
  class << self
    def execute(*args)

    end

    def parse(args)
      options = OpenStruct.new

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: jammer [command] [options] [arguments]"

      end

      opts.parse! args

      options
    end
  end
end
