require('tty-prompt')
require_relative 'choose_path.rb'

$prompt = TTY::Prompt.new

def next_choice
    go_back = $prompt.yes?("Return to philosopher list?")
    puts go_back
    if go_back == false
        puts "We can't stay here forever!"
    else 
        puts "let's keep learning!"
        choose_philosopher
    end
end

#need to populate with information parsed from json, need to include at least two female philosophers

def choose_philosopher
    philosopher_choice = $prompt.select("Choose your Philosopher", %w(Aristotle Al-Haythem Descartes Hobbes Machiavelli Socrates Confuscious Nietszche Kant Aquinas Go\ back)) 
    case philosopher_choice 
    when "Aristotle"
        puts "greek boi"
        next_choice
    when "Al-Haythem"
        puts "iraqi boi"
        next_choice
    when "Descartes"
        puts "french boi"
        next_choice
    when "Hobbes"
        puts "english boi"
        next_choice
    when "Machiavelli"
        puts "italian boi"
        next_choice
    when "Socrates"
        puts "greek boi"
        next_choice
    when "Confuscious"
        puts "china boi"
        next_choice
    when "Nietszche"
        puts "german boi"
        next_choice
    when "Kant"
        puts "german boi"
        next_choice
    when "Aquinas"
        puts "french boi"
        next_choice
    when "Go back"
        # instead of go back, implement a feature that will lead to the quiz from here.
        @@the_choice
    end
    
end



choose_philosopher