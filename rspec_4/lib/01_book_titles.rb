class Book
  attr_reader :title

  def title=(title)
    title_words = title.split(' ').map(&:downcase)
    exempt = %w{for and or an it is some of the a in}

  solution = title_words.map.each_with_index do |word, idx|
      if idx == 0
        word.capitalize
      elsif exempt.include?(word)
        word
      else
        word.capitalize
      end
    end
    # return solution.join(' ')
    @title = solution.join(' ')
  end

end
