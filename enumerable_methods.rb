module Enumerable
	def my_each
		return self unless block_given?
		for item in self
			yield(item)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for index in 0...self.length
			yield(self[index], index)
		end
	end

	def my_select
		return self unless block_given?
		selected = []
		for item in self
			selected << item if yield(item)
		end
		return selected
	end

	def my_all?
		if block_given?
			for item in self
				return false unless yield(item)
			end
		else
			for item in self
				return false unless item
			end
		end
		return true
	end

	def my_any?
		if block_given?
			for item in self
				return true if yield(item)
			end
		else
			for item in self
				return true if item
			end
		end
		return false
	end

	def my_none?
		if block_given?
			for item in self
				return false if yield(item)
			end
		else
			for item in self
				return false if item
			end
		end
		return true
	end
end
