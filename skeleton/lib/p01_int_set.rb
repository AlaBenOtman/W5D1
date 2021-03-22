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
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num) ###
     return if include?(num)
     resize! if count+1 > @store.length
        self[num] << num 
        self.count += 1
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      self.count -= 1
    end
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
  
  def resize!
    debugger
    double = (num_buckets *2 )
    old_store = @store 
    @store = Array.new(double) { Array.new }
    count = 0
    old_store.each_with_index do |ele1,i1|
      ele1.each_with_index do |ele2,i2|
        insert(ele2)
       
      end
      
    end
    @store 
  end
end
