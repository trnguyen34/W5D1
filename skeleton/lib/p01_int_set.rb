class MaxIntSet 
  attr_reader :max
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(@max)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num < 0 || num > max
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num < 0 || num > max
  end

  def validate!(num)

  end
end


class IntSet
  attr_reader :num_buckets
  attr_accessor :store
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    key = num % num_buckets
    @store[key] << num
  end

  def remove(num)
    key = num % num_buckets
    @store[key].delete(num)
  end

  def include?(num)
    key = num % num_buckets
    @store[key].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    key = num % num_buckets
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    if @count == @num_buckets
      self.resize!
    end

    key = num % num_buckets
    if self.include?(num) == false
      @store[key] << num
      @count += 1
    end
  end

  def remove(num)
    return @count if !self.include?(num)
    key = num % num_buckets
    @store[key].delete(num)
    @count -= 1
  end

  def include?(num)
    key = num % @num_buckets
    @store[key].each do |ele|
      return true if ele == num
    end

    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@num_buckets*2) {Array.new}
    @store.each do |subarray|
     subarray.each do |ele|
        key = ele % (@num_buckets*2)
        new_store[key] << ele
      end
    end

    @num_buckets *= 2
    @store = new_store
  end
end
