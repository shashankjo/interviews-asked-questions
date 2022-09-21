# FizzBuzz
#write a program that prints numbers (1-n), where n is an argument passed in. For multiples of three, you print the word “Fizz”, for multiples of five you print #“Buzz. For multiples of both three and five you print “FizzBuzz”.

def fizz_buzz(n)
  output = []
  
  (1..n).map do |num|
    fizz = (num % 3 == 0)
    buzz = (num % 5 == 0)
    if fizz && buzz
      output << 'FizzBuzz'
    elsif fizz
      output << 'Fizz'
    elsif buzz
      output << 'Buzz'
    else
      output << num
    end
  end
  
  p output
end

