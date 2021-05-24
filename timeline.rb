require('colorize')
require('tty-prompt')
require('artii')
require('json')
require('./choose_path') 
require('./quiz')

file = File.read('./timeline.json')

$philosophers = JSON.parse(file)["timeline"]

$prompt = TTY::Prompt.new

def timeline

    puts "Welcome to the Timeline!"
    puts "In this option we will go sequentially through each of our great philosophers according to when they showed up on the scene!"

    @start = $prompt.yes?("Ready to begin?")
    if @start == true
        $philosophers.each do |item|
            p item["Philosopher"]
            puts ""
            p item["Time period"]
            puts ""
            p item["Known for"]
            puts ""
            p item["Famous saying"]
            puts ""
            $prompt.keypress("Press space or enter to continue", keys: [:space, :return])
            puts ""
        end  
    else
    return error
    end

    answer = $prompt.yes?("Now that you're all done, you can either go directly to the quiz or go home") do |q|
        q.suffix "quiz/home"
    end 
    if answer == true
        take_quiz
    else
        choose
    end
end 