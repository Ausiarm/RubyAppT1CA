require('tty-prompt')
require_relative './quiz'
require_relative './philosophers'
require_relative './timeline'
require 'json'

file = File.read('./timeline.json')
$philosophers = JSON.parse(file)

def choose 
    system "clear"
    $prompt = TTY::Prompt.new(active_color: :cyan)
    the_choice = $prompt.select("Pick a path or test your knowledge!".magenta.on_blue, %w(Timeline Philosophers Quiz Exit))

    case the_choice
    when "Timeline"
        system "clear"
        timeline
        take_quiz
    when "Philosophers"
        system "clear"
        choose_philosopher
        next_choice
    when "Quiz"
        system "clear"
        take_quiz
        post_quiz
    when "Exit"
        system "clear"
        exit 
    end
end