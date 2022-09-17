puts "Введите первый коэффициент:"
a = gets.chomp.to_i
puts "Введите второй коэффициент:"
b = gets.chomp.to_i
puts "Введите третий коэффициент:"
c = gets.chomp.to_i

d = b**2 - 4*a*c
puts "Дискриминант = #{d}"
if d < 0 
  puts "Корней нет"
elsif d == 0 
  puts "Уравнение имеет 1 решение:"
  x = ((-1)*b)/2*a
  puts x  
else
  puts "Уравнение имеет 2 решения:"
  x1 = (Math.sqrt(d) - b)/2*a
  puts "Первое решение: #{x1}"    
  x2 = ((-1)*Math.sqrt(d) - b)/2*a
  puts "Второе решение: #{x2}"    
end
