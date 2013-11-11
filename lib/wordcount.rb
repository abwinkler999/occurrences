source_file = IO.readlines(ARGV[0]);
text = @source_file.join(' ').strip.split(' ');

# iterate through 'text' array.  If element is unique, push into 'words' array.  If element is not unique,
#increment 'count' for matching 'words' entry

@words = [];

# if @words is completely empty, "each" will never iterate for it.  Workaround is to seed it with one initial word.
@words << {:word => text[0], :count => 0}

text.each { |x|  # for each word in the text
	new_word = true
	@words.each { |y| # for each entry in the word hash array
		if y.has_value?(x)
			y[:count] += 1;
			new_word = false
		end
	}

	if new_word
		@words.push ({:word => x, :count => 1})
	end
}

puts "\n\r------"
puts @words

