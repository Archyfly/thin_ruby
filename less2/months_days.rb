months_hash = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 30,
  november: 30,
  december: 31
}

months_hash.each { |key, value|  puts key if value == 30 }