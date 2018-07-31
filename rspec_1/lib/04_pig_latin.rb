
def translate(words)
  sol = []

  words.split.each do |word|
    if has_qu_somewhere_ugh(word)
      sol << translate_this(word)
    elsif has_qu?(word)
      sol << word[2..-1] + word[0...2] + "ay"
    elsif has_multiple_vowel(word)
      sol << word + "ay"
    elsif begins_with_vowel?(word)
      sol << word + "ay"
    else
      sol << rule_two(word)
    end
  end
    sol.join(' ')
end

def has_qu?(word)
  return true if word[0..1] == 'qu'
  false
end

def has_qu_somewhere_ugh(word)
  combos = []
  word.chars.each_cons(2){|set| combos << set.join }
  return true if combos.include?('qu')
  false
end

def translate_this(word)
  sol = []
  word.chars.each_with_index do |letter, idx|
    if letter == 'u'
      sol << word[(idx + 1)..-1]
      sol << word[0..idx]
      sol << "ay"
    end
  end
  sol.join
end

def has_multiple_vowel(word)
  vowels = %w{a e i o u}
  if vowels.include?(word[0])
    if vowels.include?(word[1])
      return true
    end
  end
  false
end

def begins_with_vowel?(word)
  vowels = %w{a e i o u}
  if vowels.include?(word[0])
    return true
  end
  false
end

def rule_two(word)
  vowel = %w{a e i o u}
  sol = []
  word.chars.each_with_index do |letter,idx|
    if vowel.include?(letter)
      sol << word[idx..-1]
      sol << word[0..(idx-1)]
      sol << "ay"
      break
    end
  end
  sol.join
end
