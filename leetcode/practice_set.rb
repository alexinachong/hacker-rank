# Non-Leetcode Additional Practice
# A string with the characters [,],{,},(,) is said to be well-formed if
# the different types of brackets match in the correct order.

# For example, ([]){()} is well-formed, but [(]{)} is not.

# Write a function to test whether a string is well-formed.
def check_brackets(string)
  seen = []

  brackets = {
    "(" => ")",
    "[" => "]",
    "{" => "}"
    }

  string.each_char do |ch|
    if brackets.keys.include?(ch)
      seen << ch
    elsif seen.empty? || brackets[seen.pop] != ch
      return false
    end
  end

  true
end

check_brackets("([]){()}") == true
check_brackets("[(]{)}") == false

# EASY
# Q1: Two Sum
def two_sum(nums, target)
    i = 0
    while i < nums.length - 1
        complement = target - nums[i]
        return [i, (i+1 + nums[i+1..-1].index(complement))] if nums[i+1..-1].include?(complement)
        i += 1
    end
    nil
end

# Q771: Jewels and Stones
def num_jewels_in_stones(j, s)
    count = 0
    j_counts = Set.new
    j.each_char do |ch|
        j_counts.add(ch)
    end
    s.each_char do |ch|
        count += 1 if j_counts.include?(ch)
    end
    count
end

# Q595: Big Countries
# SELECT name, population, area
# FROM World
# WHERE area > 3000000 OR population > 25000000

# Q657: Judge Route Circle
def judge_circle(moves)
    vert_offset = 0
    horiz_offset = 0
    moves.each_char do |move|
        if move == "U"
            vert_offset += 1
        elsif move == "D"
            vert_offset -= 1
        elsif move == "L"
            horiz_offset -= 1
        elsif move == "R"
            horiz_offset += 1
        end
    end
    return true if vert_offset == 0 && horiz_offset == 0
    false
end

# Q728: Self Dividing Numbers
def self_dividing_numbers(left, right)
    result = []
    i = left
    while i <= right
        result << i if self_dividing_num?(i)
        i += 1
    end
    result
end

def self_dividing_num?(num)
    stringified_num = num.to_s
    num_array = stringified_num.split("").map { |el| el.to_i }
    return false if num_array.include?(0)
    num_array.each do |ch|
        return false unless num % ch == 0
    end
    true
end

# Q561: Array Partition I
def array_pair_sum(nums)
    sorted = nums.sort
    i = 0
    sum = 0
    while i < sorted.length
        sum += [sorted[i], sorted[i+1]].min
        i += 2
    end
    sum
end

# Q804: Unique Morse Code Words
require 'set'

def unique_morse_representations(words)
    alphabet = {
        "a" => ".-",
        "b" => "-...",
        "c" => "-.-.",
        "d" => "-..",
        "e" => ".",
        "f" => "..-.",
        "g" => "--.",
        "h" => "....",
        "i" => "..",
        "j" => ".---",
        "k" => "-.-",
        "l" => ".-..",
        "m" => "--",
        "n" => "-.",
        "o" => "---",
        "p" => ".--.",
        "q" => "--.-",
        "r" => ".-.",
        "s" => "...",
        "t" => "-",
        "u" => "..-",
        "v" => "...-",
        "w" => ".--",
        "x" => "-..-",
        "y" => "-.--",
        "z" => "--.."
        }

    result = Set.new
    words.each do |word|
        str = ""
        word.each_char do |ch|
            str += alphabet[ch]
        end
        result.add(str)
    end

    result.length
end

# Q412: Fizz Buzz
def fizz_buzz(n)
    result = []
    i = 1
    while i <= n
        if i % 15 == 0
            result << "FizzBuzz"
        elsif i % 3 == 0
            result << "Fizz"
        elsif i % 5 == 0
            result << "Buzz"
        else
            result << i.to_s
        end
        i += 1
    end
    result
end

# Q811: Subdomain Visit Count
def subdomain_visits(cpdomains)
    result = []
    counts = Hash.new(0)
    subdomain_counts = Hash.new(0)
    pair = []

    cpdomains.each do |domain_pair|
        pair = domain_pair.split(" ")
        counts[pair[1]] = pair[0].to_i
    end

    p counts

    counts.keys.each do |domain|
        subdomain = domain.split(".")
        i = 0
        while i < subdomain.length
            sub = subdomain[i..-1].join(".")
            subdomain_counts[sub] += counts[domain]
            i += 1
        end
    end

    subdomain_counts.each do |k, v|
        restrung = "#{v} #{k}"
        result << restrung
    end

    result
end

# Q344: Reverse String
def reverse_string(s)
    result = []
    s.each_char do |ch|
        result.unshift(ch)
    end
    result.join("")
end

# Q557: Reverse Words in a String III
def reverse_words(s)
    result_arr = []
    words = s.split

    words.each do |wd|
        result_arr << reverse_substring(wd)
    end

    result_arr.join(" ")
end

def reverse_substring(str)
    result = []
    str.each_char do |ch|
        result.unshift(ch)
    end
    result.join("")
end

# Q620: Not Boring Movies
# SELECT *
# FROM cinema
# WHERE id % 2 = 1 AND description != 'boring'
# ORDER BY rating DESC

# Q183: Customers Who Never Order
# SELECT Name AS 'Customers'
# FROM Customers
# LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
# WHERE Orders.Id IS NULL

# Q575: Distribute Candies
def distribute_candies(candies)
    max_candies_count = candies.length / 2
    uniques = candies.uniq
    uniques.length < max_candies_count ? uniques.length : max_candies_count
end

# Q766: Toeplitz Matrix
def is_toeplitz_matrix(matrix)
    i = 0
    matrix_row = matrix.length
    matrix_col = matrix[0].length
    while i < matrix_row
        j = 0
        while j < matrix_col
            if i + 1 < matrix_row && j + 1 < matrix_col && matrix[i][j] != matrix[i+1][j+1]
                return false
            end
            j += 1
        end
        i += 1
    end
    true
end

# Q566: Reshape the Matrix
def matrix_reshape(nums, r, c)
    num_cells_current = nums.length * nums[0].length
    num_cells_reshaped = r * c
    return nums if num_cells_reshaped != num_cells_current

    result = Array.new(r) { Array.new(c) }
    flattened_nums = nums.flatten
    i = 0
    row_count = 0
    while row_count < r
        col_count = 0
        while col_count < c
            result[row_count][col_count] = flattened_nums[i]
            i += 1
            col_count += 1
        end
        row_count += 1
    end

    result
end

# Q832: Flipping an Image
def flip_and_invert_image(a)
    flipped = []
    a.each do |row|
        flipped.push(row.reverse)
    end

    result = []

    flipped.each do |row|
        inner = []
        row.each do |el|
            if el == 0
                inner << 1
            else
                inner << 0
            end
        end
        result.push(inner)
    end

    result
end

# Q852: Peak Index in a Mountain Array
def peak_index_in_mountain_array(a)
    current_max = a[0]
    current_max_index = 0

    i = 1
    while i < a.length
        if a[i] > current_max
            current_max = a[i]
            current_max_index = i
        end
        i += 1
    end
    current_max_index
end

# Q821: Shortest Distance to a Character
def shortest_to_char(s, c)
    c_positions = []
    distances = []

    i = 0
    while i < s.length
        if s[i] == c
            c_positions << i
            distances[i] = 0
        end
        i += 1
    end

    j = 0
    closest_c_position_idx = 0
    while j < s.length
        if (closest_c_position_idx + 1) < c_positions.length
            dist_to_current_c = (j - c_positions[closest_c_position_idx]).abs
            dist_to_next_c = (j - c_positions[closest_c_position_idx + 1]).abs
            min_dist = [dist_to_current_c, dist_to_next_c].min
            if min_dist == dist_to_next_c
                closest_c_position_idx += 1
            end
            distances[j] = min_dist
        else
            dist_to_current_c = (j - c_positions[closest_c_position_idx]).abs
            min_dist = dist_to_current_c
            distances[j] = min_dist
        end
        j += 1
    end

    distances
end

# Q709: To Lower Case
def to_lower_case(str)
    lower = ("a".."z").to_a
    upper = ("A".."Z").to_a

    new_str = ""

    str.each_char do |ch|
        idx = upper.index(ch)
        if idx
            new_str << lower[idx]
        else
            new_str << ch
        end
    end

    new_str
end

# Q872: Leaf-Similar Trees
def leaf_similar(root1, root2)
    find_leaves(root1) == find_leaves(root2)
end

def find_leaves(root)
    return [root.val] if root.left.nil? && root.right.nil?

    l = find_leaves(root.left) if root.left
    r = find_leaves(root.right) if root.right
    if l && !r
        return l
    elsif r && !l
        return r
    else
        return l + r
    end
end

# Q461: Hamming Distance
def hamming_distance(x, y)
    binary_x = int_to_bits_array(x)
    binary_y = int_to_bits_array(y)

    max_length = [binary_x.length, binary_y.length].max

    while binary_x.length < max_length
        binary_x.unshift(0)
    end

    while binary_y.length < max_length
        binary_y.unshift(0)
    end

    different_bit_count = 0

    i = 0
    while i < binary_x.length
        if binary_x[i] != binary_y[i]
            different_bit_count += 1
        end
        i += 1
    end

    different_bit_count
end

def int_to_bits_array(num)
    result = []
    until num == 0
        result.unshift(num % 2)
        num = num / 2
    end

    if result.empty?
        return [0]
    else
        return result
    end
end

# Q867: Transpose Matrix
def transpose(a)
    transposed_array = Array.new(a[0].length) { Array.new(a.length) }

    i = 0
    while i < a.length
        j = 0
        while j < a[0].length
            transposed_array[j][i] = a[i][j]
            j += 1
        end
        i += 1
    end

    transposed_array
end

# Q876: Middle of the Linked List
def middle_node(head)
    slow = head
    fast = head

    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    slow
end

# Q896: Number of Lines to Write String
def number_of_lines(widths, s)
    alphabet = ("a".."z").to_a
    current_line_count = 0
    row_count = 1

    s.each_char do |ch|
        ch_index = alphabet.index(ch)
        ch_width = widths[ch_index]

        if current_line_count + ch_width > 100
            row_count += 1
            current_line_count = ch_width
        else
            current_line_count += ch_width
        end
    end

    return [row_count, current_line_count]
end

# Q476: Number Complement
def find_complement(num)
    binarified_array = binarify(num)
    reversed_array = []

    # Convert 0s to 1s and vice versa
    binarified_array.each do |el|
        if el == 0
            reversed_array << 1
        else
            reversed_array << 0
        end
    end

    # De-binarify
    return debinarify(reversed_array)
end

def debinarify(arr)
    power = 0
    total = 0

    until arr.length == 0
        last_num = arr.pop
        total = total + (last_num * (2 ** power))
        power += 1
    end

    total
end

def binarify(num)
    result = []

    until num == 0
        result.unshift(num % 2)
        num /= 2
    end

    if result.empty?
        return [0]
    else
        return result
    end
end

# Q884: Uncommon Words from Two Sentences
def uncommon_from_sentences(a, b)
    word_counts = Hash.new(0)

    a_words = a.split
    b_words = b.split

    a_words.each do |word|
        word_counts[word] += 1
    end

    b_words.each do |word|
        word_counts[word] += 1
    end

    word_counts.select { |k, v| v == 1 }.keys
end

# Q500: Keyboard Row
def find_words(words)
    result = []
    rows = {
        0 => "qwertyuiop",
        1 => "asdfghjkl",
        2 => "zxcvbnm"
        }

    words.each do |word|
        if rows[0].include?(word[0].downcase)
            row_num = 0
        elsif rows[1].include?(word[0].downcase)
            row_num = 1
        else
            row_num = 2
        end

        result << word if word.downcase.chars.all? { |ch| rows[row_num].include?(ch) }
    end

    result
end



# MEDIUM
# Q215: Kth Largest Element in an Array
def find_kth_largest(nums, k)
    sorted = nums.sort
	sorted[-k]
end

# Q442: Find All Duplicates in an Array
def find_duplicates(nums)
    repeats = []

    nums.each do |num|
        if nums[num.abs - 1] < 0
            repeats << num.abs
        else
            nums[num.abs - 1] *= -1
        end
    end

    repeats
end

# Q807: Max Increase to Keep City Skyline
def max_increase_keeping_skyline(grid)
    result = 0

    i = 0
    while i < grid.length
        j = 0
        els_in_row = grid[i]
        max_in_row = els_in_row.max
        while j < grid[i].length
            transposed = grid.transpose
            els_in_col = transposed[j]
            max_in_col = els_in_col.max
            max_height_of_cell = [max_in_row, max_in_col].min
            result += (max_height_of_cell - grid[i][j])
            j += 1
        end
        i += 1
    end

    result
end

# Q419: Battleships in a Board
def count_battleships(board)
    ship_count = 0
    occupied_pos = Hash.new { |h, k| h[k] = [] } # [[0, 0], [0, 1], [2, 0]] -> { 0: [0, 1], 2: [0] }

    board.each_with_index do |row, i|
        row.each_with_index do |col, j|
            if board[i][j] == "X"
                if occupied_pos.keys.include?(i)
                    if (occupied_pos[i][-1] - j).abs > 1
                        ship_count += 1
                    end
                    occupied_pos[i].push(j)
                elsif occupied_pos.keys.include?(i - 1)
                    if !occupied_pos[i - 1].include?(j)
                        ship_count += 1
                    end
                    occupied_pos[i].push(j)
                else
                    ship_count += 1
                    occupied_pos[i].push(j)
                end
            end
        end
    end
    ship_count
end

# Q179: Largest Number
def largest_number(nums)
    nums.sort! {|a, b| b.to_s + a.to_s <=> a.to_s + b.to_s }

    nums.join("").to_i.to_s
end

# Q535: Encode and Decode TinyURL
URL_TO_CODE = {}
CODE_TO_URL = {}

def encode(longUrl)
    code_options = ("a".."z").to_a + (0..9).to_a

    # generate random code
    code = "http://tinyurl.com/#{code_options.sample(6).join("")}"
    until !CODE_TO_URL.include?(code)
        code = "http://tinyurl.com/#{code_options.sample(6).join("")}"
    end

    URL_TO_CODE[longUrl] = code
    CODE_TO_URL[code] = longUrl

    code
end

# Decodes a shortened URL to its original URL.
#
# @param {string} shortUrl
# @return {string}
def decode(shortUrl)
    CODE_TO_URL.include?(shortUrl) ? CODE_TO_URL[shortUrl] : "Does not exist"
end

# Q791: Custom Sort String
def custom_sort_string(s, t)
    resorted_array = []

    t_counts = Hash.new(0)

    t.each_char do |ch|
        t_counts[ch] += 1
    end

    s.each_char do |ch|
        ch_count = t_counts[ch]
        ch_count.times do
            resorted_array << ch
        end
    end

    extra_chs = t_counts.keys - s.chars

    extra_chs.each do |ch|
        ch_count = t_counts[ch]
        ch_count.times do
            resorted_array << ch
        end
    end

    resorted_array.join("")
end

# HARD
# Q239: Sliding Window Maximum
def max_sliding_window(nums, k)
    result = []
    return result if nums.empty?
    i = 0
    while i <= nums.length - k
        range = nums[i...i + k]
        result << range.max
        i += 1
    end
    result
end

# Q765: Couples Holding Hands
def min_swaps_couples(row)
    swaps = 0
    i = 0
    j = i + 1
    while i < row.length || j < row.length
        if (row[i] % 2 == 0) && (row[j] - row[i] == 1)
            i += 2
            j += 2
        elsif (row[i] & 2 == 1) && (row[i] - row[j] == 1)
            i += 2
            j += 2
        end

    end
    swaps
end
