#Turing test
#Given an integer n and an array a of length n, your task is to apply the following mutation to a:

#Array a mutates into a new array b of length n.
#For each i from 0 to n - 1, b[i] = a[i - 1] + a[i] + a[i + 1].
#If some element in the sum a[i - 1] + a[i] + a[i + 1] does not exist, it should be set to 0. For example, b[0] should be equal to 0 + a[0] + a[1].



def solution(n, a)
  output = []
  
  (0..n-1).each_with_index do |num, index|
    if n == 1
        output << a.first
        break
    end
    left = index == 0 ? 0 : a[index - 1]
    right = index == n-1 ? 0 : a[index + 1]
    output[index] = left + a[index] + right
  end
  
  p output
end

