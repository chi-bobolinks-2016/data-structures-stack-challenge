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
      expect(empty_stack.top).to eq('new item')
    end
  end

  describe '#pop' do
    it 'removes item from top of the stack' do
      my_stack.pop
      expect(my_stack.top).to eq('second item')
    end

    it 'returns the removed item' do
      removed_element = my_stack.pop
      expect(removed_element).to eq('third item')
    end

    it 'throws error if stack is empty' do
      expect { empty_stack.pop }
        .to raise_error(NoSuchElementError)
    end
  end

  describe '#top' do
    it 'should return top element in the stack' do
      expect(my_stack.top).to eq('third item')
    end

    it 'should not change the stack' do
      before_stack = my_stack
      my_stack.top
      expect(before_stack === my_stack).to be true
    end

    it 'throws error if stack is empty' do
      expect { empty_stack.top }
        .to raise_error(NoSuchElementError)
    end
  end

  describe '#empty?' do
    it 'returns true if stack is empty' do
      expect(empty_stack.empty?).to be true
    end

    it 'returns false if array is not empty' do
      expect(my_stack.empty?).to be false
    end
  end
end
