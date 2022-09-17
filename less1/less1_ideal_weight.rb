puts "Введите ваше имя"
name = gets.chomp
puts "Введите ваш рост"
height = gets.chomp.to_i
ideal = (height-110)*1.15
ideal < 0 ? puts("#{name}, ваш вес уже оптимальный") : puts("#{name}, ваш идеальный вес: #{ideal}")
