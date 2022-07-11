class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    sum = 0
    self.each_with_index do |ele, i|
      el = ele + (i + 2)
      sum += el.hash
    end

    sum
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |char, i|
      el = char.ord + (i + 2)
      sum += el.hash
    end

    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |key, value|
      sum += key.hash + value.hash
    end

    sum
  end
end
