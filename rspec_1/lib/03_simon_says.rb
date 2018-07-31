
def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, time=2)
  ((word + " ") * time).strip
end

def start_of_word(word,ammt=1)
  word[0...ammt]
end

def first_word(sentence)
  sentence.split[0]
end

USELESS = ['and', 'or', 'a', 'of', 'the', 'over', 'in']
def titleize(sentence)
  sol = []
  sentence.split.each_with_index do |word, idx|
    if idx == 0
      sol << word.capitalize
    elsif USELESS.include?(word)
      sol << word
    else
      sol << word.capitalize
    end
  end
  sol.join(' ')
end
