require 'node'

describe Node do
  subject(:node) { Node.new }
  let(:next_node) { Node.new }
  let(:data_sample) { Object.new }

  after { node.next = nil; node.data = nil; node.head = nil }

  describe '#.next' do
    it 'responds' do
      is_expected.to respond_to(:next)
    end

    it 'returns the right node reference' do
      node.next = next_node

      expect(node.next).to be === next_node
    end

    context 'when no reference to next is set' do
      it "returns nil" do
        expect(node.next).to be_nil
      end
    end
  end

  describe '#.next=' do
    it 'responds' do
      is_expected.to respond_to(:next=)
    end
  end

  describe '#.data' do
    it 'responds' do
      is_expected.to respond_to(:data)
    end

    it 'returns the right data' do
      node.data = data_sample

      expect(node.data).to be === data_sample
    end

    context 'when no data is set' do
      it "returns nil" do
        expect(node.data).to be_nil
      end
    end
  end

  describe '#.data=' do
    it 'responds' do
      is_expected.to respond_to(:data=)
    end
  end
end
