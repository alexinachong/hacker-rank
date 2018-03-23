def check(array, king, queen)
  letter_to_num_pos = {
    "A" => 0,
    "B" => 1,
    "C" => 2,
    "D" => 3,
    "E" => 4,
    "F" => 5,
    "G" => 6,
    "H" => 7
  }

  king_pos_array = king.split("")
  king_pos_x = letter_to_num_pos[king_pos_array[0]]
  king_pos_y = king_pos_array[1].to_i

  queen_pos_array = queen.split("")
  queen_pos_x = letter_to_num_pos[queen_pos_array[0]]
  queen_pos_y = queen_pos_array[1].to_i

  if (king_pos_x - queen_pos_x == 0) || (king_pos_y - queen_pos_y == 0)
    return true
  elsif (king_pos_x - queen_pos_x).abs == (king_pos_y - queen_pos_y).abs
    return true
  else
    return false
  end 
end

arr1 = Array.new(8) { Array.new(8) }
arr1[6][3] = "K"
arr1[6][7] = "Q"

p check(arr1, "D6", "H6") # true

arr2 = Array.new(8) { Array.new(8) }
arr2[6][4] = "K"
arr2[4][4] = "Q"

p check(arr2, "E6", "E4") # true

arr3 = Array.new(8) { Array.new(8) }
arr3[1][7] = "K"
arr3[3][5] = "Q"

p check(arr3, "B7", "D5") # true

arr4 = Array.new(8) { Array.new(8) }
arr4[3][6] = "K"
arr4[7][7] = "Q"

p check(arr4, "D6", "H7") # false
