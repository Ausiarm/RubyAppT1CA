require('colorize')
require('tty-prompt')
require('artii')
require('json')
require_relative './choose_path'

def asciify_banner(input)
    a = Artii::Base.new :font => 'banner3'
    a.asciify(input)
end

def take_quiz
    $prompt = TTY::Prompt.new(active_color: :cyan)

    @user_score = 0

    def asciify_banner(input)
        a = Artii::Base.new :font => 'banner3'
        a.asciify(input)
    end

    @question_array = [
        {question:"Best known for his Meditations on Stoic philosophy. Marcus Aurelius has symbolized for many generations in the West the Golden Age of the Roman Empire.".magenta.on_blue, value: true},
        {question:"Jenny has symbolized for many generations in the West the Golden Age of the Roman Empire.".blue.on_magenta, value: false},
        {question:"Mary Walstonecroft was an english writer and passionate advocate of educational and social equality for women.".magenta.on_blue, value: true},
        {question:"Thomas Aquinas was an italian Dominican theologian, the foremost medieval Scholastic.".blue.on_magenta, value: true},
        {question:"Confucius was a french writer and feminist, a member of the intellectual fellowship of philosopher-writers.".magenta.on_blue, value: false},
        {question:"Thomas Hobbes is best known for his Meditations on Stoic philosophy.".blue.on_magenta, value: false},
        {question:"Friedrich Nietzsche was a German classical scholar and philosopher.".magenta.on_blue, value: true},
        {question:"Simone de Beauvoir was an english philosopher, scientist, and historian, best known for his political philosophy, especially as articulated in his masterpiece Leviathan (1651).".blue.on_magenta, value: false},
        {question:"Thomas Hobbes was an english philosopher, scientist, and historian, best known for his political philosophy, especially as articulated in his masterpiece Leviathan (1651).".magenta.on_blue, value: true},
        {question:"Friedrich Nietzsche was a feminist and a philosopher.".blue.on_magenta, value: false},
        {question:"Ibn Al-Haytham was a mathematician and astronomer who made significant contributions to the principles of optics and the use of scientific experiments.".magenta.on_blue, value: true},
        {question:"Aristotle was a mathematician and astronomer who made significant contributions to the principles of optics and the use of scientific experiments.".blue.on_magenta, value: false}
    ]

    puts asciify_banner("Quiz Time!").magenta.on_blue.blink

    puts "let's see if you remember what you learned about the people you've just read through.".blue.on_magenta

    sleep 2

    @question_array.each do |quiz|
        sleep 1.5
        system "clear"

        begin
            @answer = $prompt.yes?("#{quiz[:question]}") do |q|
                q.suffix "true/false"
                q.validate(/true|false/, "Please enter either true or false")
                q.modify :strip, :collapse
            end 
            if @answer == quiz[:value]
                puts ""
                puts asciify_banner("Correct!").blue.on_magenta
                @user_score += 1
            else 
                puts ""
                puts asciify_banner("Incorrect!").magenta.on_blue
            end
        rescue
            puts "there was an issue processing your response, please exit by entering clear into the command line and run the app again"
        end 
    end 
end

def post_quiz
    if @user_score > 8
        congratulations_message = $prompt.yes?("Way to go! You got #{@user_score}/12 correct. Looks like you've retained quite a bit of what you learned! Would you like to return home or exit".magenta.on_blue) do |q|
            q.suffix "home/exit"
            q.validate(/home|exit/, "Please enter either home or exit")
            q.modify :strip, :collapse
        end 
        if congratulations_message == true
            choose
        else
            exit
        end
        puts
    elsif @user_score < 8
        fail_answer = $prompt.yes?("You got #{@user_score}/12 correct. Perhaps you would like to try again?".magenta.on_blue) do |q|
            q.suffix "yes/no"
            q.validate(/yes|no/, "Please enter either yes or no")
            q.modify :strip, :collapse
        end
        if fail_answer == true
            @user_score = 0
            take_quiz
            post_quiz
        else 
            answer_no = $prompt.yes?("Fair enough. Would you like to go home or exit?".magenta.on_blue) do |q|
            q.suffix "home/exit"
            q.validate(/home|exit/, "Please enter either home or exit")
            q.modify :strip, :collapse
            end 
            if answer_no == true
                choose
            else
                exit
            end
        end
    end
end