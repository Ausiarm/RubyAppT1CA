require('tty-prompt')
# require_relative './quiz'
# require_relative './philosophers'
# require_relative './timeline'



#present users with a list of three options that link to a new pager
#option 1: timeline path
#option 2: choose your philosopher
#option 3: take philosophy quiz
def choose 
    $prompt = TTY::Prompt.new

    the_choice = $prompt.select("Pick a path or test your knowledge!", %w(Timeline Philosophers Quiz))

    case the_choice
    when "Timeline" 
        #Still need to figure this out
    when "Philosophers"
        choose_philosopher
    when "Quiz"
        take_quiz
    end
end

choose