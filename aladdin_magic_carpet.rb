# Aladdin magic carpet

def optimalPoint(magic, dist)
  # Write your code here

  magic_left, start, magic_pool = 0, 0, 0
  (0..magic.count).each do |num|
    magic_left += (magic[num].to_i - dist[num].to_i)
    if magic_left < 0
      start = num + 1
      magic_pool += magic_left
      magic_left = 0
    end
  end

  return magic_pool + magic_left >= 0 ? start : -1
end

