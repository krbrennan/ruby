class Temperature

  def initialize(options=Hash.new)
    @options = options
  end

  def in_fahrenheit
    temp = @options.values[0]
    @options.keys[0] == :f ? temp : c_to_f(temp)
  end

  def f_to_c(temp)
    ((temp.to_f - 32) * 0.556).round
  end

  def in_celsius
    temp = @options.values[0]
    @options.keys[0] == :f ? f_to_c(temp) : temp
  end

  def c_to_f(temp)
    temp.to_f * 1.8 + 32
  end

  class << self
      def from_celsius(temp)
        Temperature.new({:c=>temp})
      end

      def from_fahrenheit(temp)
         Temperature.new({:f=>temp})
      end
  end
end


class Celsius < Temperature
  def initialize(temp)
    @options = {:c=>temp}
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @options = {:f=>temp}
  end
end
