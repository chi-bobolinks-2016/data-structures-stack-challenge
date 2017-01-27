require_relative 'array_list'
require_relative 'exceptions'

class Stack

  def initialize
    @content = ArrayList.new
  end

  def push(element)
    @content.add(element)
  end

  def pop
    last_index = @content.length - 1
    last_element = self.top
    @content.set(last_index, nil)
    last_element
  end

  def top
    @content.last
  end

end
