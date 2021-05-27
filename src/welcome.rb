require('colorize')
require('tty-prompt')
require('artii')
require_relative('./choose_path')

def asciify_slant(input)
    a = Artii::Base.new :font => 'slant'
    a.asciify(input)
end

#change this entry, instead print a large Philosophize This! key art and then ask a name, get name and print it in artii format and then ask them if they'd like to learn some philosophy
puts "
██████╗ ██╗  ██╗██╗██╗      ██████╗ ███████╗ ██████╗ ██████╗ ██╗  ██╗██╗███████╗███████╗    ████████╗██╗  ██╗██╗███████╗██╗
██╔══██╗██║  ██║██║██║     ██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██║  ██║██║╚══███╔╝██╔════╝    ╚══██╔══╝██║  ██║██║██╔════╝██║
██████╔╝███████║██║██║     ██║   ██║███████╗██║   ██║██████╔╝███████║██║  ███╔╝ █████╗         ██║   ███████║██║███████╗██║
██╔═══╝ ██╔══██║██║██║     ██║   ██║╚════██║██║   ██║██╔═══╝ ██╔══██║██║ ███╔╝  ██╔══╝         ██║   ██╔══██║██║╚════██║╚═╝
██║     ██║  ██║██║███████╗╚██████╔╝███████║╚██████╔╝██║     ██║  ██║██║███████╗███████╗       ██║   ██║  ██║██║███████║██╗
╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝       ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚═╝
                                                                                                                           
".magenta.on_blue 


prompt = TTY::Prompt.new
name = prompt.ask("What is your name, scholar?")
sleep 0.5
system "clear"

puts asciify_slant("Welcome, #{name}").magenta.on_blue
puts ""
# puts "You know, #{name}, Philosophy in the traditional greek means lover of wisdom.".blue.on_magenta
# sleep 1

yes_no = prompt.yes?("In the traditional greek, Philosophy means love of wisdom. Would you like to learn about some of the greatest lovers of wisdom in human history?".blue.on_magenta) do |q|
    q.suffix "yes/no"
    q.validate(/yes|no/, "Please enter either yes or no")
    q.modify :strip, :collapse
end
system "clear"
begin
if yes_no == true
    puts asciify_slant("Let us learn!").magenta.on_blue
    sleep 2.0
    system "clear"
    choose
else 
    puts "Some have said that knowledge is a burden if it robs you of joy. Come back if you ever decide that your stance on wisdom is in need of a change"
end
rescue
end
