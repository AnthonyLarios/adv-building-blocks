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

	def my_count (object = nil)
		count = 0
		if block_given?
			for item in self
				count += 1 if yield(item)
			end
		elsif object.nil?
			count = self.length
		else
			for item in self
				count += 1 if item == object
			end
		end
		return count
	end

	def my_map
		return self unless block_given?
		array = []
		for item in self
			array << yield(item)
		end
		return array
	end

	def my_inject(initial = nil)
		total = initial.nil? ? self.first : initial
		range = initial.nil? ? self.my_count - 1 : self.my_count
		for item in self.last(range)
			total = yield(total, item)
		end
		return total
	end
end
