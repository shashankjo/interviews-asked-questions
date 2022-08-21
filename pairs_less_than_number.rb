#Turing.com test

#You are given two arrays of integers a and b of the same length, and an integer k. We will be iterating through array a from left to right, and simultaneously #through array b from right to left, and looking at pairs (x, y), where x is from a and y is from b. Such a pair is called tiny if the concatenation xy is strictly #less than k.

#Your task is to return the number of tiny pairs that you'll encounter during the simultaneous iteration through a and b.


def solution(a, b, k)
  count = 0
  
  a.each_with_index do |num, index|
    x = num
    y = b[a.size-1 - index]
    
    concatenated_num = (x.to_s + y.to_s).to_i
    count += 1 if concatenated_num < k
  end

    p count
end
