require('colorize')
require('tty-prompt')
require('artii')
require('json')
# require_relative './choose_path'


def asciify_banner(input)
    a = Artii::Base.new :font => 'banner3'
    a.asciify(input)
end

$prompt = TTY::Prompt.new

@user_score = 0

@question_array = [
        {question:"Best known for his Meditations on Stoic philosophy. Marcus Aurelius has symbolized for many generations in the West the Golden Age of the Roman Empire.", value: true},
        {question:"Jenny has symbolized for many generations in the West the Golden Age of the Roman Empire.", value: false},
        {question:"Mary Walstonecroft was an english writer and passionate advocate of educational and social equality for women.", value: true},
        {question:"Thomas Aquinas was an italian Dominican theologian, the foremost medieval Scholastic.", value: true},
        {question:"Confucius was a french writer and feminist, a member of the intellectual fellowship of philosopher-writers.", value: false},
        {question:"Thomas Hobbes is best known for his Meditations on Stoic philosophy.", value: false},
        {question:"Friedrich Nietzsche was a German classical scholar and philosopher.", value: true},
        {question:"Simone de Beauvoir was an english philosopher, scientist, and historian, best known for his political philosophy, especially as articulated in his masterpiece Leviathan (1651).", value: false},
        {question:"Thomas Hobbes was an english philosopher, scientist, and historian, best known for his political philosophy, especially as articulated in his masterpiece Leviathan (1651).", value: true},
        {question:"Friedrich Nietzsche was a feminist and a philosopher.", value: false},
        {question:"Ibn Al-Haytham was a mathematician and astronomer who made significant contributions to the principles of optics and the use of scientific experiments.", value: true},
        {question:"Aristotle was a mathematician and astronomer who made significant contributions to the principles of optics and the use of scientific experiments.", value: false}
    ]

puts asciify_banner("Quiz Time!").magenta.on_blue.blink

puts "let's see if you remember what you learned about the people you've just read through."

def take_quiz
    @question_array.each do |quiz|
        answer = $prompt.yes?("#{quiz[:question]}") do |q|
            q.suffix "true/false"
        end 
        if answer == quiz[:value]
            puts "Correct!"
            @user_score += 1
        else 
            puts "Incorrect!"
        end
    end 
end

def post_quiz
    if @user_score > 9
        puts "Way to go! You got #{@user_score}/12 correct. Looks like you've retained quite a bit of what you learned!"
    elsif @user_score < 8
        fail_answer = $prompt.yes?("You got #{@user_score}/12 correct. Perhaps you would like to try again?")
        if fail_answer == true
            @user_score = 0
            take_quiz
            post_quiz
        else 
            answer_no = $prompt.yes?("Fair enough. Would you like to go home or exit?") do |q|
            q.suffix "home/exit"
        end 
            if answer_no == "home"
                # require_relative 'choose_path.rb'
                choose
            else
                exit
            end
        end
    end
end

take_quiz
post_quiz