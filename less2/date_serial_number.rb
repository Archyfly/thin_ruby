puts "Enter date:"
data = gets.chomp.to_i
puts "Enter month number:"
month = gets.chomp.to_i
puts "Enter year:"
year = gets.chomp.to_i

if (data<=0 || data>31 || month<=0 || month>12)
  puts "Enter correct date!"
else
  serial_number = data
  months_hash = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30,
                10 => 30, 11 => 30, 12 => 31 }
  if year % 400 == 0 || year % 4 == 0 && year % 100 != 0
    months_hash[2] = 29
  end
  months_hash.each do |key, value|
    serial_number += value if key < month
  end

  puts("Your date is: #{data}.#{month}.#{year}")
  puts("Your serial number: #{serial_number}")
end

