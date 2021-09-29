instructions = File.readlines('input.txt').map { |i| [i[0], i[1..].to_i] }

a = 0
b = 0
a1, b1 = [10, -1]

def change_dir(a, b, deg)
  { 90 => [-b, a], 270 => [b, -a], 180 => [-a, -b], }[(deg + 360) % 360]
end

instructions.each do |action, value|
  case action
  when ?N
    b1 -= value
  when ?E
    a1 += value
  when ?S
    b1 += value
  when ?W
    a1 -= value
  when ?L
    a1, b1 = change_dir(a1, b1, -value)
  when ?R
    a1, b1 = change_dir(a1, b1, value)
  when ?F
    a += value * a1
    b += value * b1
  end
end

result =  [a, b].map(&:abs).sum
puts result
