module DRead
  def read_data(file, keyword)
    #initializes a local variable able to be used out of the
    #IO.foreach loop
    val = ''
    IO.foreach(file) {|x|
      key = x[0..(x.index('=')-1)]
      if key.eql?(keyword)
      x.slice!(0..x.index('='))
      val = x
      end
    }
    return val
  end
  module_function :read_data
end
