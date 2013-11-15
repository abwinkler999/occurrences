DEFAULT_KATA_SOURCE_FILE = "kata_default_file.txt"

class Word
  attr_accessor :word, :count

  def initialize(word, count)
    @word = word
    @count = count
  end

  def new_word?(identified_words)
    identified_words.each { |identified_word|
      if identified_word.word == @word
        identified_word.count += 1
        return false
      end
    }
    return true
  end
end

def source_file_path(file_name)
  File.expand_path("../../texts/#{file_name}", __FILE__)
end

def identify_source_file
  if ARGV.empty?
    read_source_file_into_word_list(source_file_path(DEFAULT_KATA_SOURCE_FILE))
  else
    read_source_file_into_word_list(source_file_path(ARGV[0]))
  end
end

def separate_into_word_list(text)
  text.strip.downcase.split(' ');
end

def strip_punctuation(text)
  text.each { |x| x.delete! ".,?!;:\"" }
end

def read_source_file_into_word_list(file_path)
  begin
    entire_text = IO.read(file_path)
  rescue
    puts "File not found."
    exit
  else
    word_list = separate_into_word_list(entire_text)
    strip_punctuation(word_list)
  end
end

def print_results(words)
  puts "Words:"
  words.sort_by! { |x| x.count}.reverse!
  words.each { |y|
    puts "#{y.word}: #{y.count}" 
  }
  puts "-- #{words.length} unique words found --"
end

@identified_words = []
text = identify_source_file
text.each { |x|
  possible_new_word = Word.new x, 1
  @identified_words.push (possible_new_word) if possible_new_word.new_word?(@identified_words)
}
print_results(@identified_words)
