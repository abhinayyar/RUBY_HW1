class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_hist_name = attr_name+"_history" # create bar_history getter

    class_eval %Q{
	def #{attr_name}=(val)
	@#{attr_hist_name} = [nil] if @#{attr_hist_name}.nil?
	if @#{attr_name}.nil?
	else
	@#{attr_hist_name} << @#{attr_name}
	end
	@#{attr_name}=val
	end
	def #{attr_hist_name};@#{attr_hist_name};end
    }
  end
end

#class Foo
#	attr_accessor_with_history :bar
#end

#f = Foo.new
#q = Foo.new
#f.bar = '3'
#f.bar = 'x'
#q.bar = 7
#f.bar = :abhishek
#f.bar = :rt
#q.bar = :chh
#print f.bar_history
#puts q.bar_history
