puts "Migration started!"

10.downto(0) do |n|
  sleep 1
  puts "Migration... #{n}"
end

puts "Migration finished!"
