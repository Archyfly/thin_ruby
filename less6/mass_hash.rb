countries = [ "RF", "China", "France", "Germany"]
capitals = ["Moscow", "Pekin", "Paris", "Berlin"]
newhash = countries.zip capitals

newhash.each {|k, v| puts("#{k} - #{v}")}

puts newhash.to_h.inspect

arr = [1, 2, 3, 4]
def summ(arr)
  s = 0
  arr.each {|a| s += a}
  return s
end

arr1 = [7, 8, 9]

arr2 = arr1.zip arr
puts arr2.inspect