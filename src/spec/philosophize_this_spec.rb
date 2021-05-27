require_relative '../quiz'
require_relative '../choose_path'

describe 'take_quiz' do
     it 'it should run through an array of key value pairs in sequential order and print them off until the user gets to the end' do
        expect(take_quiz).to eq [
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
    end
    it 'it should check if answer is equal to boolean value assigned to correct answer' do
        expect(@answer).to be_falsy
    end
end

describe 'choose' do
    it 'it should execute the take_quiz method when the user enters quiz' do 
        expect(choose).to eq [
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
    end
    it 'it should execute the next_choice method when the user is ready to move on from a philosopher' do
        expect(choose_philosopher).to be_truthy
    end
end