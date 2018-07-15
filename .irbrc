require 'rubygems'
require 'wirb'
require "awesome_print"
require 'interactive_editor'
require 'irb/completion'

AwesomePrint.irb!
Wirb.start

IRB.conf[:PROMPT][:AMIT] = {
  :PROMPT_I => "%N(%m):%03n:%i $> ",
  :PROMPT_S => "...%03n:%i%l ",
  :PROMPT_C => "...%03n:%i* ",
  :RETURN => " ==> %s\n",
  :AUTO_INDENT => true
}
IRB.conf[:PROMPT_MODE] = :AMIT
