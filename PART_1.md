## Part 1: Standard I/O streams and the file system

The article we'll work through in this part of the
course is [Building Unix-style command line
applications](https://practicingruby.com/articles/building-unix-style-command-line-applications).
Reading it carefully should prepare you to work through the following questions
and exercises.


## Exercises

> NOTE: The supporting materials for these exercises are in `samples/part1`.

In the "Building Unix-style command-line applications" article, we walked
through implementing a Ruby clone of the Unix `cat` utility. In this set of
exercises, you'll repeat a similar process to build a minimal clone of
the `ls` command. By doing so, you'll explore many of Ruby's capabilities
for working with files.

**STEP 1:** Run the following bash commands in the `data` folder and copy the
output into a text file for future reference.

```bash
$ ls
$ ls foo
$ ls foo/*.txt
$ ls -l
$ ls -a
$ ls -a -l
$ ls -l foo/*.txt
$ ls missingdir
$ ls -Z
```

**STEP 2:** Get the test harness in `ls_tests.rb` to pass its first test.
The script in `bin/ruby-ls` is a wrapper around the system `ls`
utility, so you should only need to add it to your shell's path in order
to get your first test passing. On a successful run, you should expect to
see the following output:

```
Test 1: OK
Next step: add a test for ruby-ls foo/*.txt
```

**STEP 3:** Now replace the `ruby-ls` script with a Ruby-based implementation
that passes the first test.

To complete this step, you will probably need to take a closer look at how `ls` behaves
when it is being used directly vs. how it behaves when it is run in a subshell
or as part of a command pipeline. The output format is actually simplified in
the latter case, with each entry being listed on its own line.

To see how this works, run each of commands listed in STEP 1, but pipe the output
to the cat utility, i.e. instead of typing `ls`, type `ls | cat`. It's
this behavior you will need to clone to get your `ruby-ls` program
working correctly -- the screen output for human consumption is optional.

**STEP 4:** Work your way through implementing some or all of the other use cases
listed in step 1. Start by adding an acceptance test, then implement
the correct behavior in the `ruby-ls` script. For ideas on how to write your tests, see
the [RCat acceptance tests](https://gist.github.com/sandal/1293709) from the assigned article.

Remember that you'll want to emulate the machine readable output of `ls` rather
than just the console-based output.

**STEP 5:** If you didn't already check for exit codes for successful and unsuccessful
uses of the `ruby-ls` command, add a test for them now and then implement
command termination behavior that matches how `ls` works on your system.

*If you get stuck or have questions about this exercise, file a ticket in our
Github tracker. If you'd like a code review, please submit a pull request with
your solution. Feel free to submit stuff that is still a work-in-progress!*
