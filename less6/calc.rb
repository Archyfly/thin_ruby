# puts "Введите первое число:"
# a1 = gets.chomp.to_i
# puts "Введите второе число:"
# a2 = gets.chomp.to_i
# puts "Выберите операцию: (+ - * /)"
# deal = gets.chomp
#
# begin
#   case deal
#   when '+'
#     result = a1 + a2
#   when '-'
#   result = a1 - a2
#   when '*'
#     result = a1 * a2
#   when '/'
#     result = a1 / a2
#   when '--'
#     result = Math::sqrt(-a1)
#   end
#   puts result
#   rescue StandardError => e
#   puts e.message
#   puts.class
# end

def method_with_error
  raise "oh no!"
end

method_with_error