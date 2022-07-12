class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  attr_reader :head
  attr_accessor :head, :tail
  def initialize 
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first

  end

  def last
  end

  def empty?
    head.val == nil && head.key == nil
  end

  def get(key)

  end

  def include?(key)
    current = @head

  end

  def append(key, val)
    if empty?
      @head.key = key
      @head.val = val
    else
      new_node = Node.new
      new_node.prev = @tail
      @tail.key = key
      @tail.val = val
      @tail.next = new_node
      @tail = new_node
    end
  end

  def update(key, val)

  end

  def remove(key)

  end

  def each

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
