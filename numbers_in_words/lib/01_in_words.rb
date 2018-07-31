ONES = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

MAGNITUDE ={
  100 => "hundred",
  1000 => "thousand",
  1_000_000 => "million",
  1_000_000_000 => "billion",
  1_000_000_000_000 => "trillion"
}

class Fixnum

  def in_words
    if self < 20
      ONES[self]
    elsif self < 100
      under_100
    elsif self < 1000
      under_1000
    elsif self < 1_000_000
      under_1_000_000
    elsif self < 1_000_000_000
      under_1_000_000_000
    elsif self < 1_000_000_000_000
      under_1_000_000_000_000
    elsif self < 1_000_000_000_000_000
      under_1_000_000_000_000_000
    end
  end

  def under_100
    if self % 10 == 0
      TENS[self]
    else
      TENS[self - (self % 10)] + " " + ONES[self % 10]
    end
  end

  def under_1000
    if self % 100 == 0
      ONES[self / 100] + " " + find_magnitude
    else
      ONES[first_num] + " " + find_magnitude + " " + (self % 100).in_words
    end
  end

  def under_1_000_000
    thousands = self.to_s[0...-3].to_i
    hundreds = self.to_s[-3..-1].to_i

    if self % 1000 == 0
      thousands.in_words + " " + find_magnitude
    else
      thousands.in_words + " " + find_magnitude + " " + (self % 1000).in_words
    end
  end

  def under_1_000_000_000
    millions = self.to_s[0...-6].to_i
    if self % 1_000_000 == 0
      millions.in_words + " " + find_magnitude
    else
      millions.in_words + " " + find_magnitude + " " + (self % 1_000_000).in_words
    end
  end

  def under_1_000_000_000_000
    billions = self.to_s[0...-9].to_i
    if self % 1_000_000_000 == 0
      billions.in_words + " " + find_magnitude
    else
      billions.in_words + " " + find_magnitude + " " + (self % 1_000_000_000).in_words
    end
  end

  def under_1_000_000_000_000_000
    trillions = self.to_s[0...-12].to_i
    if self % 1_000_000_000_000 == 0
      trillions.in_words + " " + find_magnitude
    else
      trillions.in_words + " " + find_magnitude + " " + (self % 1_000_000_000_000).in_words
    end
  end

  def first_num
    self.to_s.chars[0].to_i
  end

  def find_magnitude
    solution = nil
    MAGNITUDE.each do |k,v|
       if self >= k
         solution = v
       end
     end
     solution
  end

end
