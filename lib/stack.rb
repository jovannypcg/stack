require_relative './node'

class Stack
  def initialize
    @head = nil
  end

  # Adds a new item to the stack.
  # A Node object is created and then inserted into the stack.
  def push(data)
    new_node = Node.new(data)

    if empty?
      @head = new_node
    else
      new_node.next = @head
      @head = new_node
    end
  end

  # Returns the stack's size.
  def size
    return 0 if empty?

    count = 0
    current_node = @head

    while current_node
      count += 1
      current_node = current_node.next
    end

    count
  end

  # Verifies the stack is empty.
  # Returns true if the stack is empty, false otherwise.
  def empty?
    @head.nil?
  end

  # Clears the stack by setting @head to nil.
  def clear
    @head = nil
  end

  # Retrieves last item inserted in the stack
  # without removing it.
  def poll
    return @head.data unless empty?
  end

  # Retrieves last item inserted in the stack
  # and removes it.
  def pop
    return nil if empty?

    data = @head.data
    @head = @head.next

    data
  end
end
