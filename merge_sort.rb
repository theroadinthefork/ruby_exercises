def mergesort(a)
    return a if a.size < 2

    left = mergesort(a.slice!(0, a.length/2))
    right = mergesort(a)


    result = []
    until left.empty? || right.empty?
        if  left[0] <= right[0]
            result << left[0]
            left.shift
            next
        else left[0] > right[0]
            result << right[0]
            right.shift
        end
    end
    return result + left + right
end
