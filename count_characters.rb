# Interview at Andela
# Input: “AASSXERAS”
# Output: “A2S2X1E1R1A1S1"

class CountCharacters
  def initialize(str)
    @input = str
  end

  attr_accessor :input

  def task
    output = []
    input_array = input.chars

    count = 0
    prev_item = input_array[0]

    input_array.each_with_index  do |item, index|
      if item != prev_item
        output << prev_item
        output << count
        prev_item = item
        count = 1
      else
        count += 1
      end

      if index == input_array.size - 1
        output << input_array[index]
        output << count
      end
    end

    output.join
  end
end

CountCharacters.new("AASSXERAS").task

# pry(main)> CountCharacters.new("AASSXERAS").task
# "A2S2X1E1R1A1S1"
