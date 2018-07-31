class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def check_size
    if stack.size < 2
      raise "calculator is empty"
    end
     true
  end

  def push(val)
    stack << val
  end

  def plus
    check_size
    total = stack.pop(2).reduce(&:+)
    push(total)
  end

  def value
    stack.last
  end

  def minus
    check_size
    total = stack.pop(2).reduce(&:-)
    push(total)
  end

  def divide
    check_size
    total = stack.pop(2).map(&:to_f).reduce{|sum, val| sum / val}
    push(total)
  end

  def times
    check_size
    total = stack.pop(2).map(&:to_f).reduce{|sum,val| sum.to_f * val.to_f}
    push(total)
  end

  def tokens(string)
    solution = []
    numbers = *(1..9)

    string.split.each do |ele|
      if numbers.include?(ele.to_i)
        solution << ele.to_i
      else
        solution << ele.to_sym
      end
    end
    solution
  end

  def evaluate(string)
    operations = tokens(string)

    operations.each do |ele|
      if ele.class == Fixnum
        push(ele)
      elsif ele == :*
        times
      elsif ele == :/
        divide
      elsif ele == :+
        plus
      elsif ele == :-
        minus
      end
    end
  value
  end
end
