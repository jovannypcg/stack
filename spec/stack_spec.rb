require 'stack'

describe Stack do
  subject(:stack) { Stack.new }

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

  context "when retrieving item" do
    before do
      (1 .. 10).each { |num| stack.push(num) }
    end

    describe '#pop' do
      it 'retrieves item and removes it' do
        expect(stack.size).to eql(10)

        value = stack.pop
        expect(value).to eql(10)
        expect(stack.size).to eql(9)
      end

      # Should not this example raises an error?
      it "returns 'nil' when stack is empty" do
        stack.clear

        value = stack.pop
        expect(value).to be_nil
      end
    end

    describe '#poll' do
      it 'retrieves item without removing it' do
        expect(stack.size).to eql(10)

        value = stack.poll

        expect(value).to eql(10)
        expect(stack.size).to eql(10)
      end

      # Should not this example raises an error?
      it "returns 'nil' when stack is empty" do
        stack.clear
        expect(stack.poll).to be_nil
      end
    end
  end

  describe '#clear' do
    it 'flushes the stack' do
      stack.clear
      expect(stack.size).to eql(0)
    end
  end

  describe '#size' do
    it 'returns 0 when no items' do
      expect(stack.size).to eql(0)
    end

    it 'returns 3' do
      3.times { stack.push(Object.new) }

      expect(stack.size).to eql(3)
    end
  end

  describe '#empty?' do
    context 'stack contains items' do
      it "returns 'false'" do
        3.times { |num| stack.push(num) }

        expect(stack.empty?).to be_falsey
      end
    end

    context 'stack does not containt items' do
      it "returns 'true'" do
        stack.clear

        expect(stack.empty?).to be_truthy
      end
    end
  end
end
