
#module that allows for easy data read from a text file:
#text file used for easy and efficient transfer of data from the
#python method to the rails application. Less intensive than JSON.
module DRead
  def read_data(file, keyword)
    #initializes a local variable able to be used out of the
    #IO.foreach loop
    val = ''
    IO.foreach(file) {|x|
      key = x[0..(x.index('=')-1)] #compares keyword against term before the equal sign
      if key.eql?(keyword)
      x.slice!(0..x.index('=')) #sets our value to whatever is after the equal sign.
      val = x
      end
    }
    return val
  end
  module_function :read_data
end
