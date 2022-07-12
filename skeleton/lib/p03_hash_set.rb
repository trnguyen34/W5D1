class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash_key = key.hash
    @count += 1
    self[hash_key] << key
  end

  def include?(key)
    hash_key = key.hash
    self[hash_key].each do |ele|
      return true if ele == key
    end

    false
  end

  def remove(key)
    hash_key = key.hash
    if self.include?(key)
      self[hash_key].delete(key)
      @count -= 1
      return true
    end

    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!

  end
end
