require('colorize')
require('tty-prompt')
require('artii')
require('json')
require('./choose_path') 
require('./quiz')

file = File.read('./timeline.json')
$philosopher = JSON.parse(file)["timeline"]

$prompt = TTY::Prompt.new

def timeline
    puts "
    ████████╗██╗███╗   ███╗███████╗██╗     ██╗███╗   ██╗███████╗
    ╚══██╔══╝██║████╗ ████║██╔════╝██║     ██║████╗  ██║██╔════╝
       ██║   ██║██╔████╔██║█████╗  ██║     ██║██╔██╗ ██║█████╗  
       ██║   ██║██║╚██╔╝██║██╔══╝  ██║     ██║██║╚██╗██║██╔══╝  
       ██║   ██║██║ ╚═╝ ██║███████╗███████╗██║██║ ╚████║███████╗
       ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
                                                                
    ".magenta.on_blue
    puts "In this option we will go sequentially through each of our great philosophers according to when they showed up on the scene!".magenta.on_blue

    @start = $prompt.yes?("Ready to begin?".blue.on_magenta) do |q|
    q.suffix "yes/no"
    q.validate(/yes|no/, "Please enter either yes or no")
    q.modify :strip, :collapse
    end
    system "clear"
    if @start == true
        $philosopher.each do |item|
            puts item["Philosopher"].magenta.on_blue
            puts ""
            puts item["Time period"].blue.on_magenta
            puts ""
            puts item["Known for"].magenta.on_blue
            puts ""
            puts item["Famous saying"].blue.on_magenta
            puts ""
            $prompt.keypress("Press space or enter to continue".magenta.on_blue, keys: [:space, :return])
            system "clear"
        end  
    elsif @start == false
        system "clear"
        puts "Someone is indecisive!"
        sleep 1
        system "clear"
        choose
    end

    answer = $prompt.yes?("Now that you're all done, you can either go directly to the quiz or go home".blue.on_magenta) do |q|
        q.suffix "quiz/home"
        q.validate(/quiz|home/, "Please enter either quiz or home")
        q.modify :strip, :collapse
    end 
    system "clear"
    if answer == true
        take_quiz
    else
        choose
    end
end 