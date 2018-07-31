

def ftoc(temp_f)
  #subtract 32, times 9/5 1.8
  ((temp_f.to_f - 32) / 1.8).round(1)
end


def ctof(temp_c)
  ((temp_c.to_f * 1.8) + 32).round(1)
end
