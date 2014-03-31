class Array
  # Removes duplicate values from array
  # It will always take O(n) operations unless its nil or one element array
  def non_duplicates
    return self if size <= 1
    hash = {}
    each { |e| hash[e] = true }

    hash.keys
  end

end