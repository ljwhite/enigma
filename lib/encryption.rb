module Encryption
  module_function

  def split_keys(key)
    arr = []
    for i in 0..(key.length-2) do
      arr << key.slice(i,2).to_i
    end
    arr
  end

  def create_offset(date)
   ((date.to_i ** 2).to_s[-4..-1]).split("").map {|num| num.to_i}
  end

  def final_shift(key, offset)
    key.map.with_index { |v,i| v + offset[i] }
  end

  def encrypt(message,final_shift)
    character_set = ("a".."z").to_a << " "
    split_message = message.split("")
    offset_array = split_message.map.with_index do |char, index|
      offset = final_shift[index % 4]
      original = character_set.find_index(char)
      new_char_index = (original + offset) % 27
      character_set[new_char_index]
    end
    offset_array.join
  end

end
