puts "Введите длину первой стороны треугольника:"
a = gets.chomp.to_i
puts "Введите длину второй стороны треугольника:"
b = gets.chomp.to_i
puts "Введите длину третьей стороны треугольника:"
c = gets.chomp.to_i

if  (a >= b+c) || (b >= a+c) || (c >= b+a) 
  puts "С введёнными длинами сторон треугольник не получится" 
else
  if (a == b) && (a == c) 
    puts "Треугольник равносторонний"
  elsif (a == b) || (b == c) || (c == a)
    puts "Треугольник равнобедренный"
  end
  max_side = a    
  if (max_side < b)  
    max_side = b
  end
  if (max_side < c)  
    max_side = c    
  end    
  #puts "max_side is #{max_side}"
    
  if (max_side == a) && (max_side**2 == b**2 + c**2) || (max_side == b) && (max_side**2 == a**2 + c**2) || (max_side == c) && (max_side**2 == a**2 + b**2)
    puts "Треугольник прямоугольный"
  else 
    puts "Треугольник не прямоугольный"    
  end
end




