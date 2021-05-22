require('colorize')
require('tty-prompt')
require('artii')
require('json')

def asciify_banner(input)
    a = Artii::Base.new :font => 'banner3'
    a.asciify(input)
end

$prompt = TTY::Prompt.new

# def random_question
#    question_array = [
#         {question:"Best known for his Meditations on Stoic philosophy. Marcus Aurelius has symbolized for many generations in the West the Golden Age of the Roman Empire.", value: true},
#         {question:"Jenny has symbolized for many generations in the West the Golden Age of the Roman Empire.", value: false},
#         {question:"Mary Walstonecroft was an english writer and passionate advocate of educational and social equality for women.", value: true},
#         {question:"Thomas Aquinas was an italian Dominican theologian, the foremost medieval Scholastic.", value: true},
#         {question:"Confucius was a french writer and feminist, a member of the intellectual fellowship of philosopher-writers.", value: false},
#         {question:"Thomas Hobbes is best known for his Meditations on Stoic philosophy.", value: false},
#         {question:"Friedrich Nietzsche was a German classical scholar and philosopher.", value: true},
#         {question:"Simone de Beauvoir was an english philosopher, scientist, and historian, best known for his political philosophy, especially as articulated in his masterpiece Leviathan (1651).", value: false},
#         {question:"Thomas Hobbes was an english philosopher, scientist, and historian, best known for his political philosophy, especially as articulated in his masterpiece Leviathan (1651).", value: true},
#         {question:"Friedrich Nietzsche was a feminist and a philosopher.", value: false},
#         {question:"Ibn Al-Haytham was a mathematician and astronomer who made significant contributions to the principles of optics and the use of scientific experiments.", value: true},
#         {question:"Aristotle was a mathematician and astronomer who made significant contributions to the principles of optics and the use of scientific experiments.", value: false}
#     ]

#     def select_question(array)
#         return array.sample[:question] 
#     end

#     def select_answer(array)
#         return array
#     end


#         $prompt.yes?("#{select(question_array)}") 
       
#         puts question_array[0][1]
         
#         # if question == question_array.sample[1]
#         #     puts "correct!"
#         # else 
#         #     puts "Incorrect!"
#         # end 
# end


puts asciify_banner("Quiz Time!").magenta.on_blue.blink

puts "let's see if you remember what you learned about the people you've just read through."

file = File.read('./quiz.json')

quiz_array = JSON.parse(file)


answer = $prompt.yes?("#{quiz_array['Quiz_questions'][0]['question']}") 

if answer == quiz_array['Quiz_questions'][0]['answer']
    puts "Correct!"
else
    puts "Incorrect!"
end

#random_question

# if true_false == true
#     puts asciify_banner("Correct!").magenta.on_blue.blink
#     next_question
# else 
#     puts "Not Quite. How about we try that again?"
# end

#puts data_hash['philosophers'][0]["Philosopher"]

#data_hash['books']['1'] = 'I, Robot'

#data_hash['books']['2'] = 'The Caves of Steel'

#File.write('./example.json', JSON.dump(data_hash))

#quiz.each do |question|
#end 


#load one question at a time

#question should be printed as a true or false

#answering correctly should allow the user to advance and incorrectly should prompt them to answer the question again

#the quiz should pull from an array of key value pairs at random

#at the end of the quiz, the user should be congratulated and given the option to exit the app

