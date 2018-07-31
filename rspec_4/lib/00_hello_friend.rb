class Friend
  def greeting(default="")
    default == "" ? "Hello!" : "Hello, " + default + "!"
  end
end
