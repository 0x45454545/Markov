local Markov = require "Markov"

local quotes = {
  "The beginning is the most important part of the work.",
  "It is the mark of an educated mind to be able to entertain a thought without accepting it.",
  "The unexamined life is not worth living.",
  "Real knowledge is to know the extent of one’s ignorance.",
  "A journey of a thousand miles begins with a single step.",
  "Science is organized knowledge. Wisdom is organized life.",
  "I think, therefore I am.",
  "He who has a why to live can bear almost any how.",
  "A wise man proportions his belief to the evidence.",
  "Originality is the one thing which unoriginal minds cannot feel the use of.",
  "The more you struggle to live, the less you live. Give up the notion that you must be sure of what you are doing.",
  "Man is nothing else but what he makes of himself.",
  "Change your life today. Don't gamble on the future, act now, without delay.",
  "The trouble with the world is that the stupid are cocksure and the intelligent are full of doubt.",
  "In the depth of winter, I finally learned that within me there lay an invincible summer.",
  "It is not that I am mad, it is only that my head is different from yours.",
  "Do not spoil what you have by desiring what you have not.",
  "You have power over your mind — not outside events. Realize this, and you will find strength.",
  "Luck is what happens when preparation meets opportunity.",
  "No man ever steps in the same river twice, for it’s not the same river and he’s not the same man.",
  "Imagination is more important than knowledge.",
  "If I have seen further it is by standing on the shoulders of giants.",
  "Somewhere, something incredible is waiting to be known.",
  "Intelligence is the ability to adapt to change.",
  "Nothing in life is to be feared, it is only to be understood.",
  "I would rather have questions that can’t be answered than answers that can’t be questioned.",
  "You cannot teach a man anything; you can only help him find it within himself.",
  "It is not the strongest of the species that survives, nor the most intelligent, but the one most responsive to change.",
  "Prediction is very difficult, especially about the future.",
  "The present is theirs; the future, for which I really worked, is mine.",
  "Science and everyday life cannot and should not be separated.",
  "Thoroughly conscious ignorance is the prelude to every real advance in science.",
  "Science cannot solve the ultimate mystery of nature.",
  "The task is not to see what no one has yet seen, but to think what nobody has yet thought about that which everybody sees.",
  "What we observe is not nature itself, but nature exposed to our method of questioning.",
  "Learning never exhausts the mind.",
  "Man is but a reed, the weakest in nature, but he is a thinking reed.",
  "Nature uses as little as possible of anything.",
  "But still try, for who knows what is possible?",
  "I do not see that the sex of the candidate is an argument against her admission.",
  "Knowledge is power.",
  "Life is short, art long, opportunity fleeting, experience treacherous, judgment difficult.",
  "There is geometry in the humming of the strings, there is music in the spacing of the spheres.",
  "Nothing exists except atoms and empty space; everything else is opinion.",
  "Music is the pleasure the human mind experiences from counting without being aware that it is counting.",
  "The most difficult thing in life is to know yourself.",
  "The knowledge of anything, since all things have causes, is not acquired or complete unless it is known by its causes.",
  "The seeker after truth is not one who studies the writings of the ancients and follows his natural disposition…",
  "To understand a science, it is necessary to know its history.",
  "Reserve your right to think, for even to think wrongly is better than not to think at all."
}


for precision = 1, 6 do

    local chain = { }

    for _, quote in ipairs(quotes) do
        Markov.feed(chain, Markov.encode(quote, precision))
    end

    print("# Order (`" .. precision .. "`):")
    print("1. > " .. Markov.generate(chain, 128))
    print("2. > " .. Markov.generate(chain, 128))
    print("3. > " .. Markov.generate(chain, 128))

end
