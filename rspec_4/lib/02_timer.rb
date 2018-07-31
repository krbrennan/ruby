
class Timer
  attr_accessor :seconds

    def initialize
      @seconds = 0
    end

  def seconds=(seconds=0)
    @seconds = seconds
  end

  def time_string
    seconds = 0
    minutes = 0
    hours = 0
  until @seconds < 1
    if @seconds >= 3600
      hours += 1
      @seconds -= 3600
    elsif @seconds >= 60
      minutes += 1
      @seconds -= 60
    elsif @seconds < 60
      seconds += @seconds
      @seconds -=60
    end
  end
  return hours.to_s.rjust(2,"0") + ":" + minutes.to_s.rjust(2,"0") + ":" + seconds.to_s.rjust(2, "0")
  end
end
