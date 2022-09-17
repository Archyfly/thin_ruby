product_cart = {}
loop do
  puts "Enter product name or enter STOP for finish:"
  product_name = gets.chomp
  break if product_name == "stop"
  puts "Enter price per one:"
  price = gets.chomp
  puts "Enter amount of product:P"
  amount = gets.chomp
  item_in_cart = {}

  item_in_cart[price] = amount
  product_cart[product_name] = item_in_cart
end

result = {}
product_cart.each do |key, value| 
  value.each do |price, amount|
    result[key] = price.to_f * amount.to_i
  end
  puts("Product: #{key} - price:amount #{value}")
end    

puts product_cart
puts result