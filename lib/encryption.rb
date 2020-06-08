require 'pry'
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

  def final_shift(split_key, offset)
    split_key.map.with_index { |v,i| v + offset[i] }
  end

  def encrypted_message(message, shift)
    character_set = ("a".."z").to_a << " "
    split_message = message.downcase.split("")
    offset_array = split_message.map.with_index do |char, index|
      offset = shift[index % 4]
      original = character_set.find_index(char)
      # add if/else to count for valid characters
      if character_set.include?(char)
        new_char_index = (original + offset) % 27
      else
        new_char_index = original % 27
      end
      character_set[new_char_index]
    end
    offset_array.join
  end

  def generate_key
    random_number = rand(100000).to_s
    random_number = random_number.rjust(5,"0") if random_number.length < 5
    random_number
  end

  def date_today
    date = Date.today.strftime("%m%d%y")
  end

end