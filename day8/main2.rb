instructions = File.readlines('input.txt')

program = instructions.map do |ins|
  op, arg = ins.scan(/(\w+) (-\d+|\+\d+)/).flatten

  [op, arg.to_i]
end.freeze

program_with_position = (0..program.size - 1).zip(program).to_h

def follow_instructions(position, accumulator, visited, program_with_position)
  return accumulator if position == program_with_position.size

  current = program_with_position[position]
  instruction, value = current

  raise StandardError if visited.include?(position)

  case instruction
  when 'acc'
    follow_instructions(position + 1, accumulator + value, visited << position, program_with_position)
  when 'nop'
    follow_instructions(position + 1, accumulator, visited << position, program_with_position)
  when 'jmp'
    follow_instructions(position + value, accumulator, visited << position, program_with_position)
  end
end

answer = catch do |catch_obj|
  program_with_position.each do |position, instruction_set|
    instruction, value = instruction_set

    result = begin
      next if instruction == 'acc'

      if instruction == 'nop'
        temp_instruction_set = program_with_position.clone
        temp_instruction_set[position] = ['jmp', value]
        follow_instructions(0, 0, [], temp_instruction_set)
      elsif instruction == 'jmp'
        temp_instruction_set = program_with_position.clone
        temp_instruction_set[position] = ['nop', value]
        follow_instructions(0, 0, [], temp_instruction_set)
      else
        raise StandardError, 'Should not get here'
      end
    rescue StandardError
      next
    end

    throw(catch_obj, result) if result
  end
end

puts answer
