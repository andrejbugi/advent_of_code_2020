instructions = File.readlines('input.txt')

board_ids = instructions.map do |i|
  row_min = 0
  row_max = 127
  col_min = 0
  col_max = 7

  i.split('').each do |x|
    # puts x
    row_id = (row_min + row_max) / 2
    column_id = (col_min = col_max) / 2

    case x
    when 'F'
      row_max = row_id
    when 'B'
      row_min = row_id + 1
    when 'L'
      col_max = column_id
    when 'R'
      col_min = column_id + 1
    end
  end

  row_min * 8 + col_min
end

puts board_ids.max
