class Dictionary
  attr_accessor :d

  def initialize
    @d = {}
  end

  def entries
    @d
  end

  def keywords
    @d.keys.sort!
  end

  def include?(keyword)
    keywords.include?(keyword)
  end

  def add(hash)
    hash.class == Hash ? @d[hash.keys[0]] = hash.values[0] : @d[hash] = nil
  end

  def find(word)
    return {} if @d.empty?
    to_find = []
    word = %r(#{word})

    @d.keys.each do |dict_word|
      to_find << dict_word if word.match(dict_word)
    end

    sol = Hash.new
    unless to_find.empty?
      to_find.each{|word| @d.select{|k,v| sol[k] = v if k == word}}
    end
    return sol unless sol.empty?
    []
  end


  def printable
    solution = []
    @d.sort.map{|k,v| solution << %Q{[#{k}] "#{v}"}}
    solution.join("\n")
  end

end
