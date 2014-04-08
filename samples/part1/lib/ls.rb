require "optparse"

module LS
  class Application
    def initialize(argv)
      @params, @pattern = parse_options(argv)
    end

    def run
      if @pattern.empty?
        res = Dir.glob("*")
        print_output(res)
      else
        res = @pattern.inject([]) do |acc,f|
          acc << f if File.exists?(f)
        end

        print_output(res)
      end
    end

    def parse_options(argv)
      params = {}
      parser = OptionParser.new
      # parser.on("-l") { params[:long_listing] = true }

      pattern = parser.parse(argv)

      [params, pattern]
    end

    def print_output(res)
      res.each {|r| puts r}
    end
  end
end
