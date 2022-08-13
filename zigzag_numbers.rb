#Let's say a triple (a, b, c) is a zigzag if either a < b > c or a > b < c.

#Given an array of integers numbers, your task is to check all the triples of its consecutive elements for being a zigzag. More formally, your task is to construct #an array of length numbers.length - 2, where the ith element of the output array equals 1 if the triple (numbers[i], numbers[i + 1], numbers[i + 2]) is a zigzag, #and 0 otherwise.

def solution(arr)
    output = []
    arr.each_with_index do |elem, index|
    zigzag = false
    break if index + 2 == arr.size
    zigzag = true if first_zigzag?(arr, index)
    zigzag = true if second_zigzag?(arr, index)
      
    zigzag ? output << 1 : output << 0
         
    p output
end

def first_zigzag?(arr, index)
    arr[index + 1] > arr[index]  && arr[index + 1] > arr[index + 2]
end

def second_zigzag?(arr, index)
    arr[index + 1] < arr[index] && arr[index + 1] < arr[index + 2]
end
