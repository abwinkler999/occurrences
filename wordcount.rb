DEFAULT_KATA_SOURCE_FILE = "kata_default_file.txt"

class Word
end

def read_source_file(file_path)
  source_file = IO.readlines(file_path)
  text = source_file.join(' ').strip.downcase.split(' ')
  text.each { |x| x.delete! ".,?!;:\"" }
end

def seed_list_with_first_comparator_word(text)
  @identified_words << {:word => text[0], :count => 0}
end

def increment_existing_word(word)
  word[:count] += 1
end

def print_results(words)
  puts "Words:"
  words.sort_by! { |x| x[:count]}.reverse!
  words.each { |y|
    puts y[:word] + ": " + y[:count].to_s
  }
  puts "-- " + words.length.to_s + " unique words found --"
end

def new_word?(candidate)
  @identified_words.each { |word|
    if word.has_value?(candidate)
      increment_existing_word(word)
      return false
    end
  }
  return true
end

@identified_words = []
text = ARGV.empty? ? (read_source_file(DEFAULT_KATA_SOURCE_FILE)) : (read_source_file(ARGV[0]))
seed_list_with_first_comparator_word(text)
text.each { |x|
  @identified_words.push ({:word => x, :count => 1}) if new_word?(x)
}
print_results(@identified_words)
