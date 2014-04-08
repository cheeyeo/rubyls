## Questions

> NOTE: Most of these questions can directly be answered by reading
> the article, but a few might require you to search the web for
> answers. External research is not only OK, it's encouraged!

* What steps are involved in making a Ruby scripts runnable as a
command line utility? (i.e. directly runnable like `rake` or `gem`
rather than having to type `ruby my_script.rb`)

ANS:

use #!/usr/bin/env ruby (shebang line); then make script runnable by using
chmod +x bin/<myscript>

* What is `ARGF` stream used for in Ruby?

ANS:

Ruby provides a special stream object called ARGF that combines multiple input files into a single stream or falls back to standard input if no files are provided

(chap15 of pickaxe book)


* What is `$?` used for in Bash/Ruby?

ANS:

contains exit status of the last child process to terminate

* What does an exit status of zero indicate when a command line script
terminates? How about a non-zero exit status?

ANS:

0 means it completed successfully

non-zero exit status means an exception has occured.



* What is the difference between the `STDOUT` and `STDERR` output streams?

ANS:

`STDOUT` is meant for functional output

`STDERR` is for debugging output

* When executing shell commands from within a Ruby script, how can you capture
what gets written to `STDOUT`? How do you go about capturing both `STDOUT` and
`STDERR` streams?

ANS:

To capture what gets written to `STDOUT`, use the Open3.capture3 method,
which runs a shell command and returns what gets written to STDOUT and
STDERR


* How can you efficiently write the contents of an input file
to `STDOUT` with empty lines omitted? Being efficient in this context
means avoiding storing the full contents of the input file in memory
and processing the stream in a single pass.

ANS:

use File.open to read the file and then call each_line within a loop block;
use run in the loop block to iterate over each line; once end of file is reached
or theres no more lines to process the loop block will exit

this combination allows one to read and parse the contents of an input file
in memory in a single pass

* How would you go about parsing command line arguments that contain a mixture
of flags and file arguments? (i.e. something like `ls -a -l foo/*.txt`)

ANS:

Use OptionParser class and define a list of accepted flag; any unaccepted args
will be treated as file arguments once parser.parse(ARGV) is called

* What features are provided by Ruby's `String` class to help with fixed width
text layouts? (i.e. right aligning a column of numbers, or left aligning a
column of text with some whitespace after it to keep the total
column width uniform)

ANS:

use rjust(int) to format fixed width text layouts



* Suppose your script encounters an error and has to terminate itself. What is
the idiomatic Unix-style way of reporting that the command did not run
successfully?

ANS:

Write the error to STDERR and exit with a non-zero status code

e.g. inside bin/rcat

$stderr.puts "rcat: #{err.message}"
exit(1)

or use abort which combines the two steps above:

abort "rcat: #{err.message}"
