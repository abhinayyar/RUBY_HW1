module FunWithStrings
  def palindrome?
	string = self.downcase.gsub(/\W/,"")
	if string == string.reverse
		return true
	else
		return false
	end
  end
  def count_words
	h=Hash.new(0)
	str=self.downcase.gsub(/\W/," ")
	word=str.split(" ")
	word.each do |i|
		if h.assoc(i) == nil
			h.store(i,1)
		else
			h.store(i,h[i]+=1)
		end
	end
	return h
		
  end
  def anagram_groups
	value = []
	count_sub =0
	count_arr = []
	str=self.downcase.gsub(/\W/," ")
	word=str.split(" ")
	word.each do |i|
		if(count_arr.include?(i.chars.sort)==false)
			count_arr.push(i.chars.sort)
			count_sub+=1
		end
	end
	to = count_sub
	while count_sub > 0 do
		sub = []
		word.each do |i|
			if(i.chars.sort==count_arr[to-count_sub])
			sub.push(i)
			end
		end
		#print sub
		value.push(sub)	
		count_sub -=1
	end

	return value	

  end
		
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

#''.anagram_groups
