#You are given an array of non-negative integers numbers. You are allowed to choose any number from this array and swap any two digits in it. If after the swap #operation the number contains leading zeros, they can be omitted and not considered (eg: 010 will be considered just 10).

#Your task is to check whether it is possible to apply the swap operation at most once, so that the elements of the resulting array are strictly increasing.


def solution(numbers)
  output = false
  return true if numbers.size == 1
  numbers.each_with_index do |num, index|
    swapped_num = swap(num)
    
    numbers[index] = swapped_num
    if check_increasing(numbers)
        output = true 
        break
    end
  end
  
  p output
end

def check_increasing(arr)
  increasing = false
  arr.each_with_index do |elem, index|
   break if index == arr.size - 1
   if elem < arr[index + 1]
    increasing = true 
   else
    increasing = false
    break
   end
  end

  increasing
end

def swap(num)
  num.to_s.reverse.to_i
end
