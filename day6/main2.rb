input = File.open('input.txt').read.split("\n\n")

puts input.map { |g|
  qs = g.gsub(/\s/, '').chars.uniq

  qs.count do |q|
    g.split("\n").all? { |line| line.include?(q) }
  end
}.sum
