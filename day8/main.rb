instructions = File.readlines('input.txt')

program = instructions.map do |ins|
  op, arg = ins.scan(/(\w+) (-\d+|\+\d+)/).flatten

  [op, arg.to_i]
end.freeze

program_with_position = (0..program.size - 1).zip(program).to_h

def follow_instructions(position, accumulator, visited, program_with_position)
  current = program_with_position[position]
  instruction, value = current

  return accumulator if visited.include?(position)

  case instruction
  when 'acc'
    follow_instructions(position + 1, accumulator + value, visited << position, program_with_position)
  when 'nop'
    follow_instructions(position + 1, accumulator, visited << position, program_with_position)
  when 'jmp'
    follow_instructions(position + value, accumulator, visited << position, program_with_position)
  end
end

puts follow_instructions(0, 0, [], program_with_position)
