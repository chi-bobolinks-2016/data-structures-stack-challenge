require_relative 'fixed_array'
require_relative 'exceptions'

# ArrayList Growth complexity could reach an amortized constant time - 0(1) -
# If a large fixed array size was initialized and adding elements was just a matter of setting
# the new value at the end and increasing the current @length to keep track of the ArrayList size
# In order for this to work you'd need a helper method to increase the size of the FixedArray 
# Once the @length of the current ArrayList reached the size of the initialized FixedArray
# In order to copy the old FixedArray into the new FixedArray it would require Linear time - 0(n) -
# But if you are increasing the size of the array by a large number, the cost to increase it would 
# Not occur often, thus keeping the amortized growth of this ArrayList at O(1)

class ArrayList
  attr_reader :length

  def initialize
    @length = 0
    @content = FixedArray.new(0)
  end

  def add(element)
    @length += 1
    previous_array = @content
    @content = FixedArray.new(@length)
    
    i = 0
    while i < previous_array.size
      @content.set(i, previous_array.get(i))
      i += 1
    end
    @content.set(i, element)

    element
  end

  def get(index)
    raise_no_such_element(index) if index > @length - 1
    @content.get(index)
  end

  def set(index, element)
    raise_no_such_element(index) if index > @length - 1
    @content.set(index, element)
    element
  end

  def first
    raise_no_such_element if @length == 0
    @content.get(0)
  end

  def last
    raise_no_such_element if @length == 0
    @content.get(@length - 1)
  end

  def insert(index, element)
    @content.get(index) if index > 0
    if index < @length || index == 0
      @length += 1
      previous_array = @content
      @content = FixedArray.new(@length)
      @content.set(index, element)

      i = 0
      while i < @length
        if i < index
          @content.set(i, previous_array.get(i))
        end
        if i > index
          @content.set(i, previous_array.get(i - 1))  
        end
        i += 1
      end
    end
    @content
  end

  private

    def raise_no_such_element(index = 0)
      raise NoSuchElementError.new("No such element at index #{index} or ArrayList is empty")
    end

end
