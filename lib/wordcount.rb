class Word

	attr_accessor :count, :text

	def initialize(word)
		@count = 0
		@text = word
	end
end

@source_file = IO.readlines(ARGV[0]);
text = @source_file.join(' ').strip.split(' ');

# iterate through 'text' array.  If element is unique, push into 'words' array.  If element is not unique,
#increment 'count' for matching 'words' entry

@words = [];

text.each { |x|
	@words.each { |y|
		#if @words[y].has_key?(x) {
		#	@words[y] += 1;
		#}
		#else {
			@words.push ({:word => x, :count => 1})
		#}
	}
	#if @words.include?({:word => x, :count => 1})
		# increment counter
	#else
	#	@words << {:word => x, :count => 1}
	#end
}

puts @words.inspect
