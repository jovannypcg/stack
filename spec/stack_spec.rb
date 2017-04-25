require 'stack'

describe Stack do
  subject(:stack) do
    Stack.new
  end

  after { stack.clear }

  describe '#push' do
    it 'inserts one item' do
      stack.push(Object.new)
      expect(stack.size).to eql(1)
    end

    it 'inserts 5 items' do
      5.times { stack.push(Object.new) }
      expect(stack.size).to eql(5)
    end
  end

  describe '#pop' do
    before do
      stack.push(1)
      stack.push(9)
      stack.push(2)
      stack.push(8)
    end

    it 'retrieves last item and removes it' do
      expect(stack.size).to eql(4)

      value = stack.pop
      expect(value).to eql(8)
      expect(stack.size).to eql(3)
    end

    # Should not this example raises an error?
    it "returns 'nil' when stack is empty" do
      value = stack.pop

      expect(value).to be nil
    end
  end

  describe '#poll' do
    it 'retrieves last item without removing it' do
      expect(stack.size).to eql(4)

      value = stack.poll

      expect(value).to eql(8)
      expect(stack.size).to eql(4)
    end

    # Should not this example raises an error?
    it "returns 'nil' when stack is empty" do
      expect(stack.poll).to be nil
    end
  end

  describe '#.clear' do
    it 'flushes the stack' do
      stack.clear
      expect(stack.size).to eql(0)
    end
  end

  describe '#.size' do
    it 'returns 3' do
      3.times { stack.push(Object.new) }
    end
  end
end
