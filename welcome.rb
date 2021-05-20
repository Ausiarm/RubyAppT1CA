require('colorize')
require('tty-prompt')
require('artii')


def asciify_it(input)
    require ('artii')
    a = Artii::Base.new :font => 'slant'
    a.asciify(input)#.magenta.on_blue
end

puts asciify_it("Welcome").magenta.on_blue

prompt = TTY::Prompt.new

name = prompt.ask("What is your name?")

puts "You know #{name}, Descartes once famously said: I think, therefore I am. That leads me to wonder, If I emulate thought, does that then mean that I too must be? Perhaps by the end of this you will have a different opinion on the matter.".light_blue 

yes_no = prompt.yes?("So #{name}, are you a lover of wisdom? ")


if yes_no == true
    puts asciify_it("Let us learn!").magenta.on_blue
    require_relative 'timelines.rb'
else 
    puts "Some have said that knowledge is a burden if it robs you of joy. Come back if you ever decide that your stance on wisdom is in need of a change"
end
