require('tty-prompt')


prompt = TTY::Prompt.new


philosopher_choice = prompt.select("Choose your Philosopher", %w(Aristotle Al-Hazen Descartes))

#use case statement to send user to present user with appropriate information based on who they choose

case philosopher_choice 
when "Aristotle"
    puts "the greek guy"
when "Al-Hazen"
    puts "the iraqi guy"
when "Descartes"
    puts "the way too feminine guy"
end 