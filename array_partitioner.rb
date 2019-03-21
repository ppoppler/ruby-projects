# CECS 424 by Philip Poppler

#
# partition_array function
#
# recursive function that swaps whenever both the left and right 
# markers are wrong (meaning the values on the left are greater than x,
# and the values on the right are less than x). 
#
def partition_array(array,x,left=0,right=(array.length-1))
  # end condition: when the markers pass each other
  # we're done, so then return the array 
  if right < left
    return array
  end

  # when the left value is wrong
  wrong_left = array[left] > x
  # when the right value is wrong
  wrong_right = array[right] < x
  
  #if both are wrong, swap the pair
  if wrong_left && wrong_right
    array[left], array[right] = array[right], array[left]
    left = left + 1
    right = right - 1
    partition_array(array,x,left,right)
  #else if only the left is wrong, increment just the right
  elsif wrong_left
    right = right - 1
    partition_array(array,x,left,right)
  #else if the only the right is wrong, increment the left
  elsif wrong_right
    left = left + 1
    partition_array(array,x,left,right)
  end

  #return the array
  return array
end

#
# input_array function
#
# allows the user to input values for an array, up until a non numerical value is entered
#
def input_array
  array = []
  
  not_finished = true
  puts "Input values for an array. Type any non number to finish: " 
  # input values until finished 
  while(not_finished)
    input = gets.chomp
    if is_number?(input)
      array.push(input.to_i)
    else 
      not_finished = false
    end

  end
  print array
  return array
end

#
# is_number function
# 
# returns whether or not a string is a number
#
def is_number?(string)
  # catch and return false if it isn't an integer
  true if Float(string) rescue false 
end

#
# user_input function 
#
# takes in user input and for an array and for the value of x, then calls
# partition_array
#
def user_input
  array = input_array
  puts "Enter the value for x, the test value for the partitioning: "
  number_input = false
  while(!number_input)
    input = gets.chomp
    if is_number?(input)
      input = input.to_i
      number_input = true  
    end
  end
  partition_array(array,input)
end

print(user_input)

# array = partition_array([28,26,25,11,16,12,24,29,6,10],17)
# print(array)