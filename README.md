The Art of Debugging Ruby and Rails
===================================

Different Kinds of Tools
------------------------
* Some help write better code  (eg. Linters)
* Some help writing code and tests together (eg. Guard + Spork)
* Some help finding bugs, understanding errors and exploring code (eg. Better errors)

Why Developers Don't Use Tools
------------------------------
* Takes time to learn - tough if you're already behind on your project
* Inertia - unwilling to start learning again
* Usefulness of the tool is not apparent

Pry
---
* Created by John Mair, Conrad Irwin and Ryan Fitzgerald.
* Written for Ruby
* Powerful alternative to the standard IRB shell
* Runtime developer console
* Pry and its plugins have something for everyone. Pry is not a development tool – it's a toolbox!
* Wiki: https://github.com/pry/pry/wiki

Installing Pry
--------------
* To access off the command line, just gem install pry and run pry.
* To add to your rails project, add 'pry' to your Gemfile:
gem 'pry', group: :development
* To replace your default console with pry, add this to the very end of your development environment file:
silence_warnings do
  require 'pry'
  IRB = Pry
end

Using Pry - Listing
-------------------
"ls object" will show a list of all methods, properties and instance and class variables.

Use filters to limit information:
* -m: public methods
* -M: class/module methods
* -p: public methods
* -q: quiet (only methods on class singleton)
* -v: verbose (all methods in all parent classes)
* -g: all global variables
* -l: locals
* -c: constants
* -G: grep
* -i: instance variables
* -h: help

Most useful are:
* ls -Mq className
* ls -mq instance

Using Pry - Scoping
-------------------
* You can change “self” very easily by using “cd”
* cd into classes, instances, properties, rails built-in methods, ANYTHING

Some shortcuts
* cd ..     (drop scope to parent level)
* cd /      (drop scope to root level)
* cd -      (switch scope between root and last non-root level)

Using Pry - Exploring
---------------------
"find-method string" will find all methods that contain the requested string
"show-method method" name will print out the method definition

Using Pry - Shell Commands
--------------------------
Any command following a dot is sent through to the shell:
* .cat filename: will display the contents of a file
* .ls -l: will list the files and folder in the current directory
* .cd app: will move you to inside the app folder

Breakpoints with Pry
--------------------
When you run a server (non-daemonised), all it takes is:
binding.pry

Some helpful commands
whereami:           show surrounding code and current place in it
next:               next command in same frame
step:               next command in any frame
finish:             run till current frame returns
continue:           continue and end pry session

When you run a daemonised server, like pow, all it takes is:
binding.remote_pry

Jazz Hands
----------
https://github.com/nixme/jazz_hands

Collection of tools to make your debugging experience awesome!

* Pry
* Hirb
* Awesome Print
* Pry Rails
* Pry Git
* Pry Doc
* Pry Remote
* Pry Debugger
* Pry Stack Explorer
* Coolline & CodeRay
