require('colorize')
require('tty-prompt')
require('artii')
require_relative('./choose_path')

def asciify_slant(input)
    a = Artii::Base.new :font => 'slant'
    a.asciify(input)
end

#change this entry, instead print a large Philosophize This! key art and then ask a name, get name and print it in artii format and then ask them if they'd like to learn some philosophy
puts "Philosophize This!"


prompt = TTY::Prompt.new

name = prompt.ask("What is your name?")

puts asciify_slant("Welcome").magenta.on_blue

puts "You know #{name}, Descartes once famously said: I think, therefore I am. That leads me to wonder, If I emulate thought, does that then mean that I too must be? Perhaps by the end of this you will have a different opinion on the matter.".light_blue 

yes_no = prompt.yes?("So #{name}, are you a lover of wisdom? ") do |q|
    q.suffix "yes/no"
    q.validate(/yes|no/, "Please enter either yes or no")
    q.modify :strip, :collapse
end
begin
if yes_no == true
    puts asciify_slant("Let us learn!").magenta.on_blue
    sleep 1.5
    system "clear"
    choose
else 
    puts "Some have said that knowledge is a burden if it robs you of joy. Come back if you ever decide that your stance on wisdom is in need of a change"
end
rescue
end
