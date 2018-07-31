

def measure(default=1,&blk)
  time = []

  default.times do
    starting_time = Time.now
    blk.call
    ending_time = Time.now
    time << ending_time - starting_time
  end

  time.reduce(&:+) / default
end
