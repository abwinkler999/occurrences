def read_source_file
  source_file = IO.readlines("source.txt")
  text = source_file.join(' ').strip.downcase.split(' ')
	text.each { |x| x.delete! ".,?\"" }
end

def seed_list_with_first_comparator_word(text)
	@words << {:word => text[0], :count => 0}
end

def print_results(words)
	puts "Words:"
	words.sort_by! { |x| x[:count]}.reverse!
	words.each { |y|
		puts y[:word] + ": " + y[:count].to_s
	}
end

def new_word?(candidate)
	new_word = true
	@words.each { |word|
		if word.has_value?(candidate)
			word[:count] += 1
			new_word = false
		end
	}
	new_word
end

@words = []
text = read_source_file
seed_list_with_first_comparator_word(text)

text.each { |x|
	@words.push ({:word => x, :count => 1}) if new_word?(x)
}

print_results(@words)
