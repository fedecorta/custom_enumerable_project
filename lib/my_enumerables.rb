module Enumerable
  def my_each_with_index
  index = 0
    self.each do |element|
      yield(element, index) if block_given?
      index +=1
    end
    self
  end

  def my_select
    selected = []
    self.each do |element|
      selected << element if block_given? && yield(element)
    end
    selected
  end

  def my_all?
    self.each do |element|
      return false if block_given? && !yield(element)
    end
    true
  end

  def my_any?
    self.each do |element|
      return true if block_given? && yield(element)
    end
    false
  end

  def my_none?
    self.each do |element|
      return false if block_given? && yield(element)
    end
    true
  end

  def my_count
    counter = 0
    self.each do |element|
      counter += 1 if !block_given? || yield(element)
    end
    counter
  end

  def my_map
    mapped = []
    self.each do |element|
      mapped << yield(element) if block_given? 
    end
    mapped
  end

  def my_inject(initial = 0)
    accumulator = initial
    self.each do |element|
      accumulator = yield(accumulator, element) if block_given?
    end
    accumulator
  end

end


class Array
  def my_each
    for element in self
      yield element if block_given?
    end
    self
  end
end
