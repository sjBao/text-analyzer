lines = File.readlines("oliver.txt")
text = lines.join

line_count = lines.size
puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospace = text.gsub(/\s+/, '').length
puts "#{total_characters_nospace} characters excluding spaces"