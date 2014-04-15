require "etc"

class FileDetails
  MODES = { "0" => "---", "1" => "--x", "2" => "-w-", "3" => "-wx",
            "4" => "r--", "5" => "r-x", "6" => "rw-", "7" => "rwx" }

  def initialize(name)
    stats = File::Stat.new(name)

    @name   = name
    @size   = File.size(name)
    @links  = stats.nlink
    @group  = Etc.getgrgid(stats.gid).name
    @owner  = Etc.getpwuid(stats.uid).name
    @mtime  = stats.mtime.strftime("%e %b %H:%M")

    @permissions = permissions_string(stats.mode)
  end

  attr_reader :name, :size, :links, :group, :owner, :mtime, :permissions

  private

  def permissions_string(num)
    dir_flag  = num[15] == 0 ? "d" : "-"
    ugw_codes = (num & 0777).to_s(8).chars

    dir_flag + ugw_codes.map { |n| MODES[n] }.join
  end
end
