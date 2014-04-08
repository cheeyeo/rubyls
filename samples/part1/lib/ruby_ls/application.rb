module RubyLs
  class Application
    def initialize(argv)
      puts "PARAMS #{argv}"
      # @params = parse_options(argv)
      @params = argv
    end

    def run
      Dir.glob("*.txt")
    end

    def parse_options(argv)
    end

  end
end
