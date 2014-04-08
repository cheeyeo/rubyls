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

ls_output      = `ls foo/*.txt`
ruby_ls_output = `ruby-ls foo/*.txt`

abort "Failed 'ls foo/*.txt == ruby-ls foo/*.txt'" unless ls_output == ruby_ls_output

puts "Test 2: OK"

############################################################################

abort "Next step: add a test for ruby-ls -l"

puts "Test 3: OK"

############################################################################

abort "Next step: add a test for ruby-ls -a"

puts "Test 4: OK"

############################################################################

abort "Next step: add a test for ruby-ls -a -l"

puts "Test 5: OK"

############################################################################

abort "Next step: add a test for ruby-ls -l foo/*.txt"

puts "Test 6: OK"

############################################################################

abort "Next step: add a test for ruby-ls missingdir (an invalid dir)"

puts "Test 7: OK"

############################################################################

abort "Next step: add a test for ruby-ls -Z (an invalid switch)"

puts "Test 8: OK"

############################################################################

abort "Next step: add a test for ruby-ls foo"

puts "Test 9: OK"

############################################################################

puts "You passed the tests, yay!"

