require_relative 'stack'

tokens = [5, 1, 2, :+, 4, :*, :+, 3, :-]
# tokens = [2, 3, 11, :+, 5, :-, :*]
# tokens = [9, 5, 3, :+, 2, 4, :**, :-, :+ ]

def rpm_calculator(tokens)
  stack = Stack.new
  i = 0
  while i < tokens.length
    if tokens[i].class == Fixnum
      stack.push(tokens[i])
    else
      element_one = stack.pop
      element_two = stack.pop
      stack.push([element_two, element_one].reduce(tokens[i]))
    end
    i += 1
  end
  stack.top
end

p rpm_calculator(tokens)