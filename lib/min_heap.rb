class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def add(key, value = key)
    @store << HeapNode.new(key,value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def remove()
    swap(0, @store.length - 1)
    result = @store.pop()
    heap_down(0)

    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return true if @store.length == 0 
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(n)
  def heap_up(index)
    return nil if @store.empty?

    predecessor_index = (index - 1)/2
  
    if @store[index].key >= @store[predecessor_index].key || index == 0 
      return @store
    else  
      swap(index, predecessor_index)
      heap_up(predecessor_index)
    end 

  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    min = index 
    left, right = 2 * index + 1, 2 * index + 2 

    left < @store.length && @store[left].key < @store[min].key ? min = left : nil

    right < @store.length && @store[right].key < @store[min].key ? min = right : nil

    if min != index 
      swap(index, min)
      heap_down(min)
    end 
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end