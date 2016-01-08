def add_all(*nums)
  sum = 0
  i = 0
  while i < nums.length
    sum += nums[i]
    i ++
  end
  return sum
end

puts add_all(1..5)
