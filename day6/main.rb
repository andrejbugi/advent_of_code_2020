input = File.open('input.txt').read

puts input.split("\n\n").map { |g| g.gsub(/\s/, '').chars.uniq.count }.sum
