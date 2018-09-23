class Deque

  def initialize
    @numbers = []
  end

  def push(number)
    @numbers << number
  end

  def pop
    @numbers.pop
  end

  def shift
    @numbers.shift
  end

  def unshift(number)
    @numbers.unshift(number)
  end
end

# def Element

#   def initialize(number)

#   end
# end
