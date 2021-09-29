input = File.open('input.txt').read

puts input.split("\n").count { |line|
  policy, password  = line.split(':').map(&:strip)

  counts, char = policy.split(' ')
  min, max = counts.split('-').map(&:to_i)

  char_count = password.chars.count { |c| c == char }

  (min..max).cover?(char_count) }
