require 'colorize'


class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = []
    input_arr.each { |x| add(x) }
  end

  def add(new_ele)
    @internal_arr.insert(first_larger_index(new_ele), new_ele)
  end

  def size
    @internal_arr.length
  end

  def [](index)
    @internal_arr[index]
  end

  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    
    return 0 if @internal_arr.length == 0

    mid_index = (start_ind + end_ind) / 2
    mid_element = @internal_arr[mid_index]
   
    if start_ind >= end_ind
      return end_ind
    elsif target == mid_element
      return mid_index
    elsif target > mid_element
      first_larger_index(target, mid_index + 1, end_ind) 
      elsif  target < mid_element
        first_larger_index(target, start_ind, mid_index)
    end
  end

  def index(target)
    @internal_arr.find_index(target)
  end
end