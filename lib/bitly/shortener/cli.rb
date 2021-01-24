require 'optparse'

module Bitly::Shortener
  class CLI
    def self.parse(options)
      args = RequestUrl.new(nil)

      opt_parser = OptionParser.new do |opts|
        opts.banner = 'Usage: example.rb [options]'

        opts.on('-lURL', '--link=URL', 'Link to shorten') do |n|
          args.url = n
        end

        opts.on('-h', '--help', 'Prints this help') do
          puts opts
          exit
        end
      end

      opt_parser.parse!(options)

      args
    end
  end
end
