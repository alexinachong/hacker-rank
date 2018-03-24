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
