require 'forwardable'

class SimpleLinkedList
  attr_reader :elements

  def initialize(array = [])
    @elements = array.map { |number| Element.new(number) }
  end

  def push(element)
    elements << element
    self
  end

  def pop
    @elements.pop
  end

  def to_a
    data = []
    elements.reverse_each do |element|
      data << element.datum
    end
    data
  end
end

class Element
  attr_accessor :next
  attr_reader   :datum

  def initialize(number)
    @datum = number
  end
end













































































































