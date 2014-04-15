# Task: Implement the ruby-ls utility and get these tests to pass on a system
# which has the UNIX ls command present.

require "open3"

dir = File.dirname(__FILE__)
Dir.chdir("#{dir}/data")

############################################################################

ls_output      = `ls`
ruby_ls_output = `ruby-ls`

abort "Failed 'ls == ruby-ls'" unless ls_output == ruby_ls_output

puts "Test 1: OK"

############################################################################

ls_output      = `ls foo/*.txt | cat`
ruby_ls_output = `ruby-ls foo/*.txt`

abort "Failed 'ls foo/*.txt == ruby-ls foo/*.txt'" unless ls_output == ruby_ls_output

puts "Test 2: OK"

############################################################################

ls_output      = `ls -l | cat`
ruby_ls_output = `ruby-ls -l`

abort "Failed 'ls -l == ruby-ls -l'" unless ls_output == ruby_ls_output

puts "Test 3: OK"

############################################################################

ls_output      = `ls -a | cat`
ruby_ls_output = `ruby-ls -a`

abort "Failed 'ls -a == ruby-ls -a'" unless ls_output == ruby_ls_output

puts "Test 4: OK"

############################################################################

ls_output      = `ls -a -l| cat`
ruby_ls_output = `ruby-ls -a -l`

abort "Failed 'ls -a -l == ruby-ls -a -l'" unless ls_output == ruby_ls_output

puts "Test 5: OK"

############################################################################

ls_output      = `ls -l foo/*.txt | cat`
ruby_ls_output = `ruby-ls -l foo/*.txt`

abort "Failed 'ls -l foo/*.txt == ruby-ls -l foo/*.txt'" unless ls_output == ruby_ls_output

puts "Test 6: OK"

############################################################################

ls_output      = `ls missingdir | cat`
ruby_ls_output = `ruby-ls missingdir`

abort "Failed 'ls missingdir == ruby-ls missingdir'" unless ls_output == ruby_ls_output

puts "Test 7: OK"

############################################################################

ls_output      = `ls -Z | cat`
ruby_ls_output = `ruby-ls -Z`

abort "Failed 'ls -Z == ruby-ls -Z'" unless ls_output == ruby_ls_output

puts "Test 8: OK"

############################################################################

ls_output      = `ls foo | cat`
ruby_ls_output = `ruby-ls foo`

abort "Failed 'ls foo == ruby-ls foo'" unless ls_output == ruby_ls_output

puts "Test 9: OK"

############################################################################

puts "You passed the tests, yay!"

