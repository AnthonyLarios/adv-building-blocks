def bubble_sort(array)
	right_marker = array.length - 1
	until right_marker == 1
		for left_marker in (0...right_marker)
			if array[left_marker] > array[left_marker + 1]
				array[left_marker], array[left_marker + 1] = array[left_marker + 1], array[left_marker]
			end
		end
		return array if sorted?(array)
		right_marker -= 1
	end
	array
end

def bubble_sort_by(array)
	right_marker = array.length - 1
	until right_marker == 1
		for left_marker in (0...right_marker)
			if yield(array[left_marker], array[left_marker + 1]) > 0
				array[left_marker], array[left_marker + 1] = array[left_marker + 1], array[left_marker]
			end
		end
		return array if sorted?(array)
		right_marker -= 1
	end
	array
end

def sorted?(array_to_check)
	if array_to_check[0].is_a? (String)
		array_to_check.each_cons(2).all? { |left, right| left.length <=> right.length < 1}
	else
		array_to_check.each_cons(2).all? { |left, right| left <=> right < 1}
	end
end

p bubble_sort([4,3,78,2,0,2])
incremental_sort = bubble_sort_by(["hi","hello","hey"]) do |left,right| 
	right.length - left.length
end
p incremental_sort
p bubble_sort_by(["hi","hello","hey"]) { |left,right| right.length - left.length }
