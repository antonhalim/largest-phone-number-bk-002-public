def largest_phone_number(numbers)
	raise StandardError if numbers.class != Array || numbers.empty?
	phone_numbers = parse_numbers(numbers)
	largest_sum = 0
	largest_number = 0
	phone_numbers.each do |numbers|
		total = 0
		numbers.each do |number|
			total += number.to_i
		end
		if largest_sum <= total
			largest_sum = total
			largest_number = numbers
		end
	end
	return numbers.select{|x| x.split("").last(4) == largest_number.last(4)}[0]
end

def parse_numbers(numbers)
	parsed_numbers = []
	numbers.each do |number|
		sanitized = ["(", ")", "-", " "]
		phone_number = number
		sanitized.each do |symbol|
			phone_number = phone_number.gsub(symbol[0],"")
		end
		parsed_numbers << phone_number.split("")
	end
	parsed_numbers
end
