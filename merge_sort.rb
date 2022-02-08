def mergesort(a)
    return a if a.size < 2
    if a.size == 2 
        if a[0] < a[-1]
            return [a[0], a[-1]]
        else  
            return [a[-1], a[0]]
        end
    else
        left = mergesort(a.slice!(0, a.length/2))
        right = mergesort(a)
    end

    result = []
    until left.size == 0 && right.size == 0
        if right.size == 0  || (left.size != 0 && left[0] < right[0])
            result << left[0]
            left.shift
            next
        elsif left.size == 0 || (right.size != 0 && left[0] > right[0])
            result << right[0]
            right.shift
            next
        else
            result << left[0]
            left.shift
        end
    end
    return result
end


p mergesort([4,8,6,2,1,7,5,3,9])
