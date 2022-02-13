# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # sums up each element in array
  sum = 0
  arr.each { |a| sum += a }
  return sum
end

def max_2_sum arr
  # if array is empty or length of 1, return 0
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    # else iterate through array finding max two integers
    max1 = 0
    max2 = 0
    
    # initialize max1 and max2 with first two integers (where max1 >= max2)
    if arr[0] >= arr[1]
      max1 = arr[0]
      max2 = arr[1]
    else
      max2 = arr[0]
      max1 = arr[1]
    end
    
    for a in 3..arr.length do
      # only replaces max1 assuming next integers is greater than max1 and max2
      if arr[a-1] > max1 and arr[a-1] > max2
        max1 = arr[a-1]
        max2 = max1
      elsif arr[a-1] > max2
        max2 = arr[a-1]
      end
    end
    
    # return sum of max two integers
    return max1 + max2
  end
end

def sum_to_n? arr, n
  # if array is not at least size 2, return false
  if arr.length <= 2
    return false
  else
    # double for loop to consider all possible pairs, if sum is equal to n return true
    for a in 0..arr.length-1 do
      for b in a+1..arr.length-1 do
        if arr[a] + arr[b] == n
          return true
        end
      end
    end
    
    # return false if no possible pairs sum to n
    return false
  end
end

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant? s
  s =~ /^[bcdfghjklmnpqrstvwxyz].*$/i
end

def binary_multiple_of_4? s
  # return false if null string
  if(s.length == 0)
    return false
  end
  
  # add up binary number into decimal then modulus by 4
  bin = 0
  for a in 0..s.length-1 do
    # indexing from end not beginning
    ind = s.length-a-1
    
    # if any characters in string is not 0 or 1, meaning not binary string, return false
    if s[ind] != '0' and s[ind] != '1'
      return false
    else
      bin += s[ind].chr.to_i * (2 ** a)
    end
  end
  
  return bin.modulo(4) == 0
end

# Part 3

class BookInStock
  def initialize(start_isbn, start_price)
    raise ArgumentError.new("Expected a non-empty ISBN") if start_isbn == ""
    raise ArgumentError.new("Expected a price > 0, but got #{start_price}") if start_price <= 0
    @isbn = start_isbn
    @price = start_price
  end
  
  attr_accessor :isbn
  attr_accessor :price
  
  def price_as_string
    "$%0.2f" % [price]
  end
end
