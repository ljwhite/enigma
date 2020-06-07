module Encryption
  module_function

  def split_keys(key)
    arr = []
    for i in 0..(key.length-2) do
      arr << key.slice(i,2).to_i
    end
    arr
  end

end
