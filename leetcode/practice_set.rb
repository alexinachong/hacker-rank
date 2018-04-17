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

# MEDIUM
# Q442: Find All Duplicates in an Array

# Q807: Max Increase to Keep City Skyline

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
