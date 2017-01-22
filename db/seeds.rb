100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale")
end

puts "100 Posts have been created."
