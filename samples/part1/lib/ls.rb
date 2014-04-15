require "optparse"
require_relative "./file_details"

module LS
  class Application
    def initialize(argv)
      @params, @files = parse_options(argv)
    end

    def run
      # files are empty if no filenames are passed
      if @files.empty?
        @globbed = false

        if @params[:all_files]
          files = Dir.glob("*", File::FNM_DOTMATCH)
        else
          files = Dir.glob("*")
        end
      elsif File.directory?(@files.first)
        Dir.chdir(@files.first)
        files = Dir.glob("*")
      else
        @globbed = true
        files = @files
      end

      if @params[:show_details] && !@globbed
        blocks = files.reduce(0) { |s,e| File.exist?(e) ? s + File.stat(e).blocks : s }
        puts "total #{blocks}"
      end

      print_output(files: files, show_details: @params[:show_details])
    end

    def parse_options(argv)
      params = {}
      parser = OptionParser.new

      parser.on("-a") { params[:all_files]    = true }
      parser.on("-l") { params[:show_details] = true }

      begin
        files = parser.parse(argv)
      rescue OptionParser::InvalidOption => e
        # use reg exp using the array form
        bad_flag = e.message[/invalid option: -(.*)/, 1]

        abort "ls: illegal option -- #{bad_flag}\n"+
        "usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]"
      end

      [params, files]
    end

    def print_output(files:, show_details: false)
      files.each do |f|
        if File.exist?(f)
          if show_details
            details = FileDetails.new(f)

            puts details.permissions + details.links.to_s.rjust(3, " ") + " " +
        details.owner + "  " + details.group + details.size.to_s.rjust(@globbed ? 4 : 5  , " ") +
        " " + details.mtime + " " + details.name
          else
            puts f
          end
        else
          abort "ls: missingdir: No such file or directory"
        end
      end
    end
  end
end
