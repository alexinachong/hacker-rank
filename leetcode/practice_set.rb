# Q1: two_sum
def two_sum(nums, target)
    i = 0
    while i < nums.length - 1
        complement = target - nums[i]
        return [i, (i+1 + nums[i+1..-1].index(complement))] if nums[i+1..-1].include?(complement)
        i += 1
    end
    nil
end
