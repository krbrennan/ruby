def add(num1,num2)
  num1 + num2
end

def subtract(num1,num2)
  num1 - num2
end

def sum(arr)
  if arr.empty?
    return 0
  end
  arr.reduce(&:+)
end

def multiply(*nums)
  nums.reduce(&:*)
end

def divide(num1,num2)
  num1 / num2
end

def power(num1,num2)
  num1 ** num2
end

def factorial(num)
  return 1 if num == 0
  (1..(num-1)).each do |numb|
    num *= numb
  end
  num
end
