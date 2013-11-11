source_file = IO.readlines("source.txt");
text = source_file.join(' ').strip.downcase.split(' ');

text.each { |x| x.delete! ".,?\"" }

words = [];

# if @words is completely empty, "each" will never iterate for it.  Workaround is to seed it with one initial word.
words << {:word => text[0], :count => 0}

text.each { |x|
	new_word = true
	words.each { |y|
		if y.has_value?(x)
			y[:count] += 1;
			new_word = false
		end
	}
	if new_word
		words.push ({:word => x, :count => 1})
	end
}


puts "Words:"
words.sort_by! { |x| x[:count]}.reverse!
words.each { |y|
	puts y[:word] + ": " + y[:count].to_s
}


