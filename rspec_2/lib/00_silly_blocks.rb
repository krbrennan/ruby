
def reverser(&blk)
  blk.call.split.map(&:reverse).join(' ')
end

def adder(default=1,&blk)
  blk.call + default
end


def repeater(num_times=1, &blk)
  num_times.times do
    blk.call
  end
end
