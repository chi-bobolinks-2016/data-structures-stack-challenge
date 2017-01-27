require_relative 'stack'

describe Stack do
  let(:my_stack) { Stack.new }
  let(:empty_stack) { Stack.new }

  before do
    my_stack.push("first item")
    my_stack.push("second item")
    my_stack.push("third item")
  end

  describe '#push' do
    it 'adds an element to the top of the stack' do
      my_stack.push("fourth item")
      expect(my_stack.top).to eq('fourth item')
    end

    it 'adds an element even if stack is empty' do
      empty_stack.push("new item")
      expect(my_stack.top).to eq('new item')
    end
  end

  describe '#pop' do
    it 'removes item from top of the stack' do
      
    end
  end
end
