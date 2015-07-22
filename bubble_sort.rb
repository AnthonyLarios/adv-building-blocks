def bubble_sort(array)
	#Create a variable for the last number
	right_marker = array.length - 1

	until right_marker == 1
		#You stop before the last number since it was previously compared when
		#left_marker was equal to right_marker - 1
		for left_marker in (0...right_marker)
			#Swap the values of the numbers if the left number is greater than the right
			if array[left_marker] > array[left_marker + 1]
				array[left_marker], array[left_marker + 1] = array[left_marker + 1], array[left_marker]
			end
		end
		#Check if the array is sorted and ready to be returned
		return array if sorted?(array)
		#Continue sorting and ignore right number since it is now the largest number
		right_marker -= 1
	end
	array
end

#Very similar to bubble_sort
def bubble_sort_by(array)
	right_marker = array.length - 1
	until right_marker == 1
		for left_marker in (0...right_marker)
			#The only difference is the yield to accept a block for sorting
			if yield(array[left_marker], array[left_marker + 1]) > 0
				array[left_marker], array[left_marker + 1] = array[left_marker + 1], array[left_marker]
			end
		end
		#Check if the array is sorted and ready to be returned
		return array if sorted?(array)
		right_marker -= 1
	end
	array
end

def sorted?(array_to_check)
	#Sort by numbers or by length if array is a string
	if array_to_check[0].is_a? (String)
		array_to_check.each_cons(2).all? { |left, right| left.length <=> right.length < 1}
	else
		array_to_check.each_cons(2).all? { |left, right| left <=> right < 1}
	end
end

p bubble_sort([4,3,78,2,0,2])
#The do/end block only works if stored in a variable. Using ruby 1.9.3p547
incremental_sort = bubble_sort_by(["hi","hello","hey"]) do |left,right| 
	right.length - left.length
end
p incremental_sort
p bubble_sort_by(["hi","hello","hey"]) { |left,right| right.length - left.length }
