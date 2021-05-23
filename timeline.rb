require('colorize')
require('tty-prompt')
require('artii')
require('json')
require('./choose_path') 
require('./quiz')

file = File.read('./timeline.json')

$philosophers = JSON.parse(file)["timeline"]

$prompt = TTY::Prompt.new






puts "Welcome to the Timeline!"
puts "In this option we will go sequentially through each of our great philosophers according to when they showed up on the scene!"

@start = $prompt.yes?("Ready to begin?")
if @start == true
        $philosophers.each do |item|
            puts item["Philosopher"]
            puts item["Time period"]
            puts item["Known for"]
            puts item["Famous saying"]
            $prompt.keypress("Press space or enter to continue", keys: [:space, :return]) 
    end  
else
    return error
end

answer = $prompt.yes?("Now that you're all done, you can either go directly to the quiz or go home") do |q|
    q.suffix "quiz/home"
end 
if answer == "quiz"
    take_quiz
elsif answer == "home"
    choose
end

# $philosophers["timeline"].each do |philosopher|
    
#     puts [philosopher]["Philosopher"]
#     puts [philosopher]["Time period"]
#     puts [philosopher]["Known for"]
#     puts [philosopher]["Famous saying"]
    
# end

# def timewalk
#     @position = 0
#     puts $philosophers["timeline"][@position]["Philosopher"]
#     puts $philosophers["timeline"][@position]["Time period"]
#     puts $philosophers["timeline"][@position]["Known for"]
#     puts $philosophers["timeline"][@position]["Famous saying"]
#     @position += 1
# end

# while var < 10
#     $prompt.keypress("Press space or enter to continue", keys: [:space, :return]) 
#     timewalk
#     var += 1
#     @position += 1
#     puts @position
# end

   


#timeline shold be a chronological procession of the philosophers to be presented 

#user should be allowed to advance through by using the enter key alone (maybe)

#the timeline should be an array of key value pairs that include :date, :name, :idea

#by pressing enter, the user should be able to move from one to the next with information presented in a succinct manner

#at the end the user should be prompted with a message that says quiz time and enter to advance