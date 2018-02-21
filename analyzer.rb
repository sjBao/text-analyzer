if ARGV.empty?
  puts 'Usage: ruby analyzer.rb filename.txt'
  return 1
end

filename = ARGV[0]
STOPWORDS = %w[the a by on for of are with just but and to the my I has some in].freeze
lines = File.readlines(filename)
text = lines.join

line_count = lines.size
total_characters = text.length
total_characters_nospace = text.gsub(/\s+/, '').length

all_words = text.split
word_count = all_words.length

good_words = all_words.reject { |word| STOPWORDS.include?(word) }
good_word_count = good_words.length

good_percentage = ((good_word_count.to_f / word_count.to_f ) * 100).to_i
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
