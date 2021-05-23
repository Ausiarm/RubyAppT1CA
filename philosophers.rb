require('tty-prompt')
require 'json'
require('./choose_path')

file = File.read('./timeline.json')

$philosophers = JSON.parse(file)

$prompt = TTY::Prompt.new

def next_choice
    go_back = $prompt.yes?("Return to philosopher list?")
    if go_back == false
        puts "We can't stay here forever!"
        choose_philosopher
    else 
        puts "let's keep learning!"
        choose_philosopher
    end
end

#need to populate with information parsed from json, need to include at least two female philosophers

def choose_philosopher
    philosopher_choice = $prompt.select("Choose your Philosopher", %w(Aristotle Al-Haytham Aquinas Aurelius Beauvoir Confucius Descartes Hobbes Nietszche Wollstonecraft Go\ back)) 
    case philosopher_choice 
    when "Aristotle"
        puts "#{$philosophers['timeline'][0]['Known for']}"
        next_choice
    when "Descartes"
        puts "#{$philosophers['timeline'][1]['Known for']}"
        next_choice
    when "Confucius"
        puts "#{$philosophers['timeline'][2]['Known for']}"
        next_choice
    when "Al-Haytham"
        puts "#{$philosophers['timeline'][3]['Known for']}"
        next_choice
    when "Hobbes"
        puts "#{$philosophers['timeline'][4]['Known for']}"
        next_choice
    when "Nietszche"
        puts "#{$philosophers['timeline'][5]['Known for']}"
        next_choice
    when "Beauvoir"
        puts "#{$philosophers['timeline'][6]['Known for']}"
        next_choice
    when "Aquinas"
        puts "#{$philosophers['timeline'][7]['Known for']}"
        next_choice
    when "Aurelius"
        puts "#{$philosophers['timeline'][8]['Known for']}"
        next_choice
    when "Wollstonecraft"
        puts "#{$philosophers['timeline'][9]['Known for']}"
        next_choice
    when "Go back"
        # require_relative 'choose_path.rb'
        choose
    end
    
end



choose_philosopher