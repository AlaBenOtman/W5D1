require "byebug"
class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)

  end

  def []=(index, bool)
    @store[index] = bool
  end

  def insert(num)
    if is_valid?(num)
     @store[num] = true 
    else 
      raise "Out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false 
    end
  end

  def include?(num)
    if is_valid?(num)
      @store[num] 
    end
  end
  
  private

  def is_valid?(num)
     num >= 0 && num < @max
  end

  def validate!(num)
    
  end
  
end


class IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
