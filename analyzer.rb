if ARGV.length < 1
  puts 'Usage: ruby analyzer.rb filename.txt'
  return
end

filename = ARGV[0]

lines = File.readlines(filename)
text = lines.join

STOPWORDS = %w[the a by on for of are with just but and to the my I has some in].freeze

line_count = lines.size
total_characters = text.length
total_characters_nospace = text.gsub(/\s+/, '').length
# p text.scan(/[\w\-]+/).length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospace} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{word_count / sentence_count} words per sentences (average)"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
