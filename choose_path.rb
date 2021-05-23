require('tty-prompt')
require('./quiz')

$prompt = TTY::Prompt.new

#present users with a list of three options that link to a new pager
#option 1: timeline path
#option 2: choose your philosopher
#option 3: take philosophy quiz
def choose 
    the_choice = $prompt.select("Pick a path or test your knowledge!", %w(Timeline Philosophers Quiz))

    case the_choice
    when "Timeline" 
        #require_relative 'timeline.rb'
    when "Philosophers"
        #require_relative 'philosophers.rb'
    when "Quiz"
        take_quiz
    end
end

choose