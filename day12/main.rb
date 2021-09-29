instructions = File.readlines('input.txt').map { |i| [i[0], i[1..].to_i] }

a = 0
b = 0
direction = [1, 0]

def change_dir(dir, deg)
  turns = deg / 90
  dirs = [[0, -1], [-1, 0], [0, 1], [1, 0]]
  index = dirs.index(dir) + turns
  dirs[index % 4]
end

instructions.each do |action, value|
  case action
  when ?N
    b -= value
  when ?E
    a += value
  when ?S
    b += value
  when ?W
    a -= value
  when ?L
    direction = change_dir(direction, value)
  when ?R
    direction = change_dir(direction, -value)
  when ?F
    a += value * direction[0]
    b += value * direction[1]
  end
end

result = [a, b].map(&:abs).sum
puts result
