class Bst
  attr_reader :data, :left, :right

  def initialize(number)
    @data = number
    @left = nil
    @right = nil
  end

  def insert(number)
    if number <= data
      insert_left(number)
    else
      insert_right(number)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    @left.each(&block) if @left
    yield @data
    @right.each(&block) if @right
  end

  private

  def insert_left(number)
    if @left
      @left.insert(number)
    else
      @left = self.class.new(number)
    end
  end

  def insert_right(number)
    if @right
      @right.insert(number)
    else
      @right = self.class.new(number)
    end
  end
end
