arr = ("a".."z").to_a
hash = {}

arr.each_with_index do |letter, index|
  if letter.match(/[aeiou]/)
    hash[letter] = index
  end
end

print hash