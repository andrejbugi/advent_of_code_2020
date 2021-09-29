input = File.open('input.txt').read

puts input.split("\n").count { |line|
  policy, password  = line.split(':').map(&:strip)

  counts, char = policy.split(' ')
  pos1, pos2 = counts.split('-').map(&:to_i)

  (password[pos1 - 1] == char) ^ (password[pos2 - 1] == char)
}
