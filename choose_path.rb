require('tty-prompt')
require_relative './quiz'
require_relative './philosophers'
require_relative './timeline'
require 'json'

file = File.read('./timeline.json')

$philosophers = JSON.parse(file)["timeline"]

def choose 
    $prompt = TTY::Prompt.new

    the_choice = $prompt.select("Pick a path or test your knowledge!", %w(Timeline Philosophers Quiz))

    case the_choice
    when "Timeline" 
        timeline
    when "Philosophers"
        choose_philosopher
        next_choice
    when "Quiz"
        take_quiz
        post_quiz
    end
end