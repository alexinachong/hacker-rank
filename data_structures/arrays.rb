# Given an array, A, of N integers, print each element in reverse order as a single line of space-separated integers.

# The first line contains an integer, N (the number of integers in A).
# The second line contains N space-separated integers describing A.

# Print all N integers in A in reverse order as a single line of space-separated integers.

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

arr.reverse.each do |el|
    print el
    print " "
end

# Sample Input:
# 4
# 1 4 3 2

# Sample Output:
# 2 3 4 1
