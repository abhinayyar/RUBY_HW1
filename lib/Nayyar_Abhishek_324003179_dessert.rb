class Dessert
	attr_accessor :name, :calories
  def initialize(name, calories)
    	@name=name
	@calories=calories
  end
  def healthy?
	if(@calories < 200)
	return true
	else
	return false
	end
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
	attr_accessor :flavor
  def initialize(flavor)
	@calories = 5
	@name = flavor.to_s+' jelly bean'
	@flavor=flavor
  end
 
  def delicious?
  	if flavor == "licorice"
		return false
  	else
		return true
  	end
  end
end

#ob=JellyBean.new("ulicorice")
#ob.delicious?
#puts ob.name
