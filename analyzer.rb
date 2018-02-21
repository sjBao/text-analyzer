# checks to see if ARGV is present
if ARGV.empty?
  puts 'Usage: ruby analyzer.rb filename.txt'
  return 1
end

# opens specified file and parses text
filename = ARGV[0]
STOPWORDS = %w[the a by on for of are with just but and to the my I has some in].freeze
lines = File.readlines(filename)
text = lines.join

# gets characters, line, sentence, and paragrah count
line_count = lines.size
total_characters = text.length
total_characters_nospace = text.gsub(/\s+/, '').length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# gets all words and good words (non-stop words)
all_words = text.split
word_count = all_words.length
good_words = all_words.reject { |word| STOPWORDS.include?(word) }
good_word_count = good_words.length

# calculates
good_percentage = ((good_word_count.to_f / word_count.to_f) * 100).to_i

# summarize input text file by selecting 'ideal sentences'
sentences = text.gsub(/\s+/, ' ').strip.split(/\?|\.|!/)
sentences_sorted = sentences.sort_by(&:length)
one_third = sentences_sorted.length / 3

ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospace} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{word_count / sentence_count} words per sentences (average)"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{good_percentage}% of words are non-fluff words"
