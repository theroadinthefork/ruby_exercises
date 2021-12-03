def bubble_sort(list)
  temp_list = list
  final_list = []

    temp_list.each_with_index do |item, index|
      if temp_list[index+1].nil?
        break
      elsif item > temp_list[index+1]
        temp = item
        temp_list[index] = temp_list[index+1]
        temp_list[index+1] = temp
      else
        next
      end
    final_list.unshift(temp_list[-1])
    temp_list.drop
    end

  temp_list
end


p bubble_sort([4,3,78,2,0,2])
