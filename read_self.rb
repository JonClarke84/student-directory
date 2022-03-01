path = __FILE__

file = File.open(path).each do |lines|
  puts lines
end